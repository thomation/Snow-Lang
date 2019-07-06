class BinaryExpr
    def eval(env)
        return compute_op(left.eval(env), operator.value, right.eval(env))
    end
    def compute_op(left, op, right)
        return compute_number(left, op, right)
    end
    def compute_number(left, op, right)
        a = left
        b = right
        case op
        when "+"
            return a + b
        when "-"
            return a - b
        when "*"
            return a * b
        when "/"
            return a / b
        else
            raise "Invalid operator #{op}"
        end
    end
end