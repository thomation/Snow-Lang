require_relative 'ASTBranch'

class ClassStatement < ASTBranch
    def name
        child(0)
    end
    def body
        child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "ClassStatement")
        name.test(level + 1, "name")
        body.test(level + 1, "body")
    end
end