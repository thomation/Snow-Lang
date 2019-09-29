class BinaryExpr
    def eval(env)
        if operator.value == "="
            return compute_assign(env, right.eval(env))
        end
        return compute_op(left.eval(env), operator.value, right.eval(env))
    end
    def compute_assign(env, rvalue)
        if left.is_a? Name
            if left.local?
                env.put_new(left.name, rvalue)
            else
                env.put(left.name, rvalue)
            end
            return rvalue
        end
        if left.is_a? AccessClassMemberStatement
            o = env.get(left.object.name)
            o.write(left.member.name, rvalue)
            return rvalue
        end
        if left.is_a? AccessArrayMemberStatement
            a = env.get(left.name.name)
            a.write(left.access_key.value, rvalue)
            return rvalue
        end
        raise "The left part is not a id but #{left.class}"
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