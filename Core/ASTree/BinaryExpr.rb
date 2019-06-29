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
    def test
        puts BinaryExpr
        puts "left:"
        left.test
        puts "operator:"
        operator.test
        puts "right:"
        right.test
    end
end