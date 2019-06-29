require_relative 'ASTBranch'

class PrimaryExpr < ASTBranch
    def test
        puts "Primary"
        super
    end
end