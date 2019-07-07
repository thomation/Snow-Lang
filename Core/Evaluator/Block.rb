class Block
    def eval(env)
        result = 0
        index = 0
        while index < childrenAmount do
            result = child(index).eval(env)
            index += 1
        end
        return result
    end
end