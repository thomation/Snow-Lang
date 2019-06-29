require_relative 'ASTBranch'

class NegativeExpr < ASTBranch
    def operand
        return child(0)
    end
end