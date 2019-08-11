require_relative 'ASTBranch'

class AccessClassMemberStatement < ASTBranch
    def object
        child(0)
    end
    def member
        child(1)
    end
    def argsAmount
        childrenAmount - 2
    end
    def arg(index)
        child(index + 2)
    end
    def test(level, tag)
        debug_log(level, tag, "AccessClassMemberStatement")
        object.test(level + 1, "Object")
        member.test(level + 1, "Member")
        i = 0
        while i < argsAmount do
            arg(i).test(level + 1, "Arg")
            i += 1
        end
    end
end