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
    def initialize
        super
        @desc = "Call: reg, num of args"
        @id = Opcode::CALL
    end
end