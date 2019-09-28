require_relative '../Instruction/JumpInstruction'
require_relative '../Instruction/ConstInstruction'

class LoopStatement
    def compile(code)
        old_reg = code.next_reg

        iconst = ConstInstruction.new
        iconst.set_value(0)
        iconst.encode(code)

        pos = code.position
        condition.compile(code)
        
        IfZeroInstruction.new.encode(code) do
            code.next_reg = old_reg
            loop_statement.compile(code)
            goto = GotoInstruction.new
            goto.encode(code)
            goto.update_offset_with_pos(pos)
        end
    end
end