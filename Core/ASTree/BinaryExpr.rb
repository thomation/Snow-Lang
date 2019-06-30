require_relative 'ASTBranch'

class BinaryExpr < ASTBranch
    def left
        return child(0)
    end
    def operator
        return child(1)
    end
    def right
        return child(2)
    end
    def test(level, tag)
        debug_log(level, tag, "BinaryExpr")
        left.test(level + 1, "left")
        operator.test(level + 1, "operator")
        right.test(level + 1, "right")
    end
end