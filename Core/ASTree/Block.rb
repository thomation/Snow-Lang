require_relative 'ASTBranch'

class Block < ASTBranch
    def test(level, tag)
        debug_log(level, tag, "Block")
        debug_log(level, tag, "{")
        index = 0
        while index < childrenAmount do
            child(index).test(level + 1, "statement")
            index += 1
        end
        debug_log(level, tag, "}")
    end
end