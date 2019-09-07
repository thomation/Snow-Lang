require_relative '../Opcode'

class NumberLiteral
    include Opcode

    def compile(code)
        code.add(ICONST)
        code.add(value)
        code.add(encode_register(code.next_reg))
        code.next_reg += 1
    end
end