require_relative '../Opcode'
class NegativeExpr
    include Opcode
    def compile(code)
        operand.compile(code)
        code.add(NEG)
        code.add(encode_register(code.next_reg - 1))
    end
end