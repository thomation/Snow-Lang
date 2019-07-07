class BinaryExpr
    def eval(env)
        if operator.value == "="
            return compute_assign(env, right.eval(env))
        end
        return compute_op(left.eval(env), operator.value, right.eval(env))
    end
    def compute_assign(env, rvalue)
        if left.is_a? Name
            env.put(left.name, rvalue)
            return rvalue
        end
        raise "The left part is not a id"
    end
    def compute_op(lvalue, op, rvalue)
        return compute_number(lvalue, op, rvalue)
    end
    def compute_number(lvalue, op, rvalue)
        a = lvalue
        b = rvalue
        case op
        when "+" then return a + b
        when "-" then return a - b
        when "*" then return a * b
        when "/" then return a / b
        when ">" then return a > b ? 1 : 0
        when "<" then return a < b ? 1 : 0
        when ">=" then return a >= b ? 1 : 0
        when "<=" then return a <= b ? 1 : 0
        else
            raise "Invalid operator #{op}"
        end
    end
end