require_relative '../Opcode'
class BranchStatement
    include Opcode
    def compile(code)
        index = 0
        while index * 2 < childrenAmount do
            if is_else? index
                compile_without_conditon(code, index)
            else
                compile_with_condition(code, index)
            end

            index += 1
        end
    end
    def compile_without_conditon(code, index)
        compile_block(code, index)
    end
    def compile_block(code, index)
        old_reg = code.next_reg
        branch_statement(index).compile(code)
        code.next_reg = old_reg
        GOTO.encode(code)
        GOTO.update_offset_with_current_pos
    end
    def compile_with_condition(code, index)
        condition(index).compile(code)
        IFZERO.encode(code)
        compile_block(code, index)
        IFZERO.update_offset_with_current_pos
    end
end