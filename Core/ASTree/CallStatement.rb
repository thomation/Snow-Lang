require_relative 'ASTBranch'

class CallStatement < ASTBranch
    def name
        child(0)
    end
    def arg(index)
        child(index + 1)
    end
    def argsAmount
        childrenAmount - 1
    end
    def test(level, tag)
        debug_log(level, tag, "CallStatement")
        name.test(level + 1, "Function Name")
        i = 0
        while i < argsAmount do
            arg(i).test(level + 1, "Arg")
            i += 1
        end
    end
end