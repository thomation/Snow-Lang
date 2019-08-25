require_relative 'ASTBranch'

class AccessArrayMemberStatement < ASTBranch
    def object
        child(0)
    end
    def access_key
        child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "AccessArrayMemberStatement")
        object.test(level + 1, "Object")
        access_key.test(level + 1, "access_key")
    end
end