require_relative 'Instruction'
require_relative 'Opcode'

class SaveInstruction < Instruction
    def initialize
        super
        @desc = "Save: stack offset"
        @id = Opcode::SAVE
    end
end
class RestoreInstruction < Instruction
    def initialize
        super
        @desc = "Restore: stack offset"
        @id = Opcode::RESTORE
    end
end
class ReturnInstruction < Instruction
    def initialize
        super
        @desc = "Return:"
        @id = Opcode::RETURN
    end
end
class CallInstruction < Instruction
    attr_writer :args_num
    attr_writer :entry

    def initialize
        super
        @desc = "Call: reg, num of args"
        @id = Opcode::CALL
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
        @code_seg.add(@entry)
        @code_seg.add(@args_num)
    end
    def decode(vm_segs, vm_regs)
        super
        pc = @vm_regs[:pc]
        code_seg = @vm_segs[:code]
        code_seg[pc + 1]
    end
end