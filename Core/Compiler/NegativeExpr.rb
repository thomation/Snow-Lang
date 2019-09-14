require_relative '../Opcode'
class NegativeExpr
    include Opcode
    def compile(code)
        operand.compile(code)
        NEG.encode(code)
    end
end