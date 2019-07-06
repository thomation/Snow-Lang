class PrimaryExpr
    def eval(env)
        if childAmount == 1
            return child(0).eval(env)
        end
        return child(1).eval(env)
    end
end