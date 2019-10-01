require_relative '../Instruction/ConstInstruction'

class NumberLiteral
    def compile(code, env)
        iconst = ConstInstruction.new
        iconst.set_value(value)
        iconst.encode(code)
    end
end