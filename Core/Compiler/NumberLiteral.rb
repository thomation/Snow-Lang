require_relative '../Opcode'

class NumberLiteral
    include Opcode

    def compile(code)
        ICONST.set_value(value)
        ICONST.encode(code)
    end
end