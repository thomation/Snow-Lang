require_relative 'ASTBranch'

class ClassStatement < ASTBranch
    def name
        child(0)
    end
    def super_name
        return child(2) if has_super
    end
    def has_super
        return childrenAmount > 2
    end
    def body
        child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "ClassStatement")
        name.test(level + 1, "name")
        super_name.test(level + 1, "super") if has_super
        body.test(level + 1, "body")
    end
end