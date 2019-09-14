require_relative '../Instruction/ConstInstruction'

class NumberLiteral
    def compile(code)
        iconst = ConstInstruction.new
        iconst.set_value(value)
        iconst.encode(code)
    end
end