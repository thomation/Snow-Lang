require_relative '../Instruction/ComputeInstruction'
class NegativeExpr
    def compile(code, env)
        operand.compile(code, env)
        NegInstruction.new.encode(code)
    end
end