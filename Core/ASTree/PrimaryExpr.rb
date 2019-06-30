require_relative 'ASTBranch'

class PrimaryExpr < ASTBranch
    def test(level, tag)
        super(level, "Primary")
    end
end