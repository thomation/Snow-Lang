require_relative 'Instruction'

class MoveInstruction < Instruction
    def set_offset(offset)
        @offset = offset
    end
end
class LoadInstruction < MoveInstruction
    def initialize
        super
        @id = 11
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

        pc + 3
    end
end
class StoreInstruction < MoveInstruction
    def initialize
        super
        @id = 12
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
        stack[fp + decode_offset(des)] = register[decode_register(src)]

        pc + 3
    end
end