require_relative 'ASTBranch'

class AccessArrayMemberStatement < ASTBranch
    def name
        child(0)
    end
    def access_key
        child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "AccessArrayMemberStatement")
        name.test(level + 1, "name")
        access_key.test(level + 1, "access_key")
    end
end