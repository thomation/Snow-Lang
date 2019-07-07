class LoopStatement
    def eval(env)
        result = 0
        while child(0).eval(env) != 0 do
            result = child(1).eval(env)
        end
        return result
    end
end