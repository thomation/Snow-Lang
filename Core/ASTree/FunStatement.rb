require_relative 'ASTBranch'

class FunStatement < ASTBranch
    def params
        child(0)
    end
    def body
        child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "FunStatement")
        params.test(level + 1, "paramaters")
        body.test(level + 1, "body")
    end
end