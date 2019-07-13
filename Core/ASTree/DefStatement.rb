require_relative 'ASTBranch'

class DefStatement < ASTBranch
    def name
        child(0)
    end
    def params
        child(1)
    end
    def body
        child(2)
    end
    def test(level, tag)
        debug_log(level, tag, "DefStatement")
        name.test(level + 1, "function name")
        params.test(level + 1, "paramaters")
        body.test(level + 1, "body")
    end
end