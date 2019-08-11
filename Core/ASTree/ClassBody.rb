require_relative 'ASTBranch'

class ClassBody < ASTBranch
    def test(level, tag)
        debug_log(level, tag, "ClassBody")
        i = 0
        while i < childrenAmount do
            member = child(i)
            member.test(level + 1, member.class)
            i += 1
        end
    end
end