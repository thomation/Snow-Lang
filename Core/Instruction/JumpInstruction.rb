require_relative 'Instruction'
class JumpInstruction < Instruction
    def encode(code_seg)
        super
        @start_pos = @code_seg.position
        @offset_pos = do_encode
        yield self if block_given?
        update_offset_with_current_pos
    end
    def update_offset_with_current_pos
        update_offset_with_pos(@code_seg.position)
    end
    def update_offset_with_pos(pos)
        offset_value = pos - @start_pos
        @code_seg.set(encode_offset(offset_value), @offset_pos)
    end
end
class GotoInstruction < JumpInstruction
    def initialize
        super
        @id = 21
        @desc = "goto: pc offset -> goto pc offset"
    end

    def do_encode
        @code_seg.add(self)
        @code_seg.add(offset_placeholder)
        @code_seg.position - 1
    end
   
    def decode(vm_segs, vm_regs)
        super

        code_seg = vm_segs[:code]
        pc = vm_regs[:pc]

        pc += code_seg[pc + 1]
        pc
    end
end

class IfZeroInstruction < JumpInstruction
    def initialize
        @id = 22
        @desc = "ifzero: r, pc offset -> r==0? goto pc offset"
    end

    def do_encode
        @code_seg.add(self)
        @code_seg.next_reg -= 1
        @code_seg.add(encode_register(@code_seg.next_reg))
        @code_seg.add(offset_placeholder)
        @code_seg.position - 1
    end

    def decode(vm_segs, vm_regs)
        super

        registers = vm_segs[:reg]
        code_seg = vm_segs[:code]
        pc = vm_regs[:pc]

        v = registers[decode_register(code_seg[pc + 1])]
        if v == 0
            pc += code_seg[pc + 2]
        else
            pc += 3
        end

        pc
    end
end