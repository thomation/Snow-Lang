class NegativeExpr
    def eval(env)
        value = operand.eval(env)
        return -value
    end
end