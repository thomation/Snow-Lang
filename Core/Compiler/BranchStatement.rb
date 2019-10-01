require_relative '../Instruction/JumpInstruction'
class BranchStatement
    def compile(code, env)
        @block_finish_jumps = []
        index = 0
        while index * 2 < childrenAmount do
            if is_else? index
                compile_without_conditon(code, env, index)
            else
                compile_with_condition(code, env, index)
            end

            index += 1
        end
        @block_finish_jumps.each{|goto| goto.update_offset_with_current_pos}
    end
    def compile_without_conditon(code, env, index)
        compile_block(code, env, index)
    end
    def compile_block(code, env, index)
        old_reg = code.next_reg
        branch_statement(index).compile(code, env)
        code.next_reg = old_reg
        goto = GotoInstruction.new
        goto.encode(code)
        @block_finish_jumps << goto
    end
    def compile_with_condition(code, env, index)
        condition(index).compile(code, env)
        IfZeroInstruction.new.encode(code, env){compile_block(code, env, index)}
    end
end