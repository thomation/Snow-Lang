require_relative '../Instruction/ComputeInstruction'
class NegativeExpr
    def compile(code)
        operand.compile(code)
        NegInstruction.new.encode(code)
    end
end