require_relative 'ASTBranch'

class NegativeExpr < ASTBranch
    def operand
        return child(0)
    end
    def test(level, tag)
        debug_log(level, tag, "NegativeExpr")
        operand.test(level + 1, "operand")
    end
end