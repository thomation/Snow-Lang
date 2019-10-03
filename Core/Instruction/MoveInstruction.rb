require_relative 'Instruction'

class MoveInstruction < Instruction
    def initialize
        super
        @value = nil
    end
    def set_offset(offset)
        @offset = offset
    end
    def decode_report
        @value.to_s
    end
end
class LoadInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::LOAD
        @desc = "load: offset -> reg"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_offset(@offset))
        @code_seg.add(encode_register(@code_seg.next_reg))
        @code_seg.next_reg += 1
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        stack = vm_segs[:stack]
        pc = vm_regs[:pc]
        fp = vm_regs[:fp]
        src = code_seg[pc + 1]
        des = code_seg[pc + 2]
        register[decode_register(des)] = stack[fp + decode_offset(src)]
        @value = register[decode_register(des)]

        pc + 3
    end
end
class StoreInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::STORE
        @desc = "store: reg -> offset"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_register(@code_seg.next_reg - 1))
        @code_seg.add(encode_offset(@offset))
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        stack = vm_segs[:stack]
        pc = vm_regs[:pc]
        fp = vm_regs[:fp]
        src = code_seg[pc + 1]
        des = code_seg[pc + 2]
        addr = fp + decode_offset(des)
        stack[addr] = register[decode_register(src)]
        @value = stack[addr]
        vm_regs[:sp] = addr if addr > vm_regs[:sp]

        pc + 3
    end
end
class PushInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::PUSH
        @desc = "Push: reg"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_register(@code_seg.next_reg - 1))
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        stack = vm_segs[:stack]
        pc = vm_regs[:pc]
        sp = vm_regs[:sp]

        src = code_seg[pc + 1]
        addr = sp + 1
        stack[addr] = register[decode_register(src)]
        @value = stack[addr]
        vm_regs[:sp] = addr

        pc + 2
    end
end
class PopInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::POP
        @desc = "Pop: reg"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_register(@code_seg.next_reg))
        @code_seg.next_reg += 1
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        stack = vm_segs[:stack]
        pc = vm_regs[:pc]
        sp = vm_regs[:sp]

        des = code_seg[pc + 1]
        register[decode_register(des)] = stack[sp]
        @value = register[decode_register(des)]
        vm_regs[:sp] -= 1

        pc + 2
    end
end
class GLoadInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::GLOAD
        @desc = "gload: offset -> reg"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_offset(@offset))
        @code_seg.add(encode_register(@code_seg.next_reg))
        @code_seg.next_reg += 1
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        heap = vm_segs[:heap]
        pc = vm_regs[:pc]

        src = code_seg[pc + 1]
        des = code_seg[pc + 2]

        register[decode_register(des)] = heap.read(decode_offset(src))
        @value = register[decode_register(des)]

        pc + 3
    end
end
class GStoreInstruction < MoveInstruction
    def initialize
        super
        @id = Opcode::GSTORE
        @desc = "gstore: reg -> offset"
    end
    def encode(code)
        super
        @code_seg.add(self)
        @code_seg.add(encode_register(@code_seg.next_reg - 1))
        @code_seg.add(encode_offset(@offset))
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = vm_segs[:code]
        register = vm_segs[:reg]
        heap = vm_segs[:heap]
        pc = vm_regs[:pc]

        src = code_seg[pc + 1]
        des = code_seg[pc + 2]

        addr = decode_offset(des)
        heap.write(addr, register[decode_register(src)])
        @value = heap.read(addr)

        pc + 3
    end
end