require_relative '../Opcode'
class BranchStatement
    include Opcode
    def compile(code)
        # TODO: support mutiple branches
        index = 0
        while index <= 0 do
            condition(index).compile(code)
            pos1 = code.position
            code.add(IFZERO)
            code.next_reg -= 1
            code.add(encode_register(code.next_reg))
            code.add(offset_placeholder)
            old_reg = code.next_reg

            branch_statement(index).compile(code)
            pos2 = code.position
            code.add(GOTO)
            code.add(offset_placeholder)
            # correct offset of ifzero
            code.set(encode_offset(code.position - pos1), pos1 + 2)

            # TODO: handle else branch
            code.next_reg = old_reg
            # correct goto after block
            code.set(encode_offset(code.position - pos2), pos2 + 1)

            index += 1
        end
    end
end