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
        pos2 = code.position
        code.add(GOTO)
        code.add(offset_placeholder)
        code.next_reg = old_reg
        # correct goto after block
        code.set(encode_offset(code.position - pos2), pos2 + 1)
    end
    def compile_with_condition(code, index)
        condition_false_pos = compile_condition(code, index)
        compile_block(code, index)
        # correct offset of ifzero
        code.set(encode_offset(code.position - condition_false_pos), condition_false_pos + 2)
    end
    def compile_condition(code, index)
        condition(index).compile(code)
        pos1 = code.position
        code.add(IFZERO)
        code.next_reg -= 1
        code.add(encode_register(code.next_reg))
        code.add(offset_placeholder)
        pos1
    end
end