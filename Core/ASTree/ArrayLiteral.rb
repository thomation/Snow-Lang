require_relative 'ASTBranch'

class ArrayLiteral < ASTBranch
    def element(index)
        child(index)
    end
    def size
        childrenAmount
    end
    def test(level, tag)
        debug_log(level, tag, "ArrayLiteral")
        i = 0;
        while i < size do
            element(i).test(level + 1, "Element #{i}:")
            i += 1
        end
    end
end