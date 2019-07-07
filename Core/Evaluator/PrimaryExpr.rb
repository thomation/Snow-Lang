class PrimaryExpr
    def eval(env)
        if childrenAmount == 1
            return child(0).eval(env)
        end
        return child(1).eval(env)
    end
end