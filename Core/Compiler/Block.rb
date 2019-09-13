require_relative '../Opcode'
class Block
    include Opcode
    def compile(code)
        if childrenAmount > 0
            init_reg = code.next_reg
            index = 0
            while index < childrenAmount do
                code.next_reg = init_reg
                child(index).compile(code)
                index += 1
            end
        else
            code.add(ICONST)
            code.add(0)
            code.add(encode_register(code.next_reg))
            code.next_reg += 1
        end
    end
end