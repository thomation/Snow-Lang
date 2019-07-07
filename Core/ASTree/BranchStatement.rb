require_relative 'ASTBranch'

class BranchStatement < ASTBranch
    def condition(index)
        return nil unless !is_else?(index)
        return child(index * 2)
    end
    def is_else?(index)
        return index * 2 + 1 >= childrenAmount
    end
    def branch_statement(index)
        return child(index * 2) unless !is_else?(index)
        return child(index * 2 + 1)
    end
    def test(level, tag)
        debug_log(level, tag, "BranchStatement")
        index = 0
        while index * 2 < childrenAmount do
            if index == 0
                condition(index).test(level + 1, "condition")
                branch_statement(index).test(level + 1, "if")
            elsif is_else?(index)
                branch_statement(index).test(level + 1, "else")
            else
                condition(index).test(level + 1, "condition")
                branch_statement(index).test(level + 1, "elseif")
            end
            index += 1
        end
    end
end