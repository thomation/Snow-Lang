require_relative 'ASTBranch'

class ParamsList < ASTBranch
    def name(index)
        child(index)
    end
    def size
        childrenAmount
    end
    def test(level, tag)
        debug_log(level, tag, "ParamsList")
        i = 0
        while i < size
            name(i).test(level + 1, "param")
            i += 1
        end
    end
end