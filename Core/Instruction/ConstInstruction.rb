require_relative 'Instruction'

class ConstInstruction < Instruction
    def initialize
        super
        @desc = "iconst: v->r"
        @id = 1
    end
    def set_value(value)
        @value = value
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
        @code_seg.add(@value)
        @code_seg.add(encode_register(@code_seg.next_reg))
        @code_seg.next_reg += 1
    end
    def decode(vm_segs, vm_regs)
        super
        registers = @vm_segs[:reg]
        code_seg = @vm_segs[:code]
        pc = vm_regs[:pc]
        registers[decode_register(code_seg[pc + 2])] = code_seg[pc + 1]
        pc += 3
        pc
    end
end