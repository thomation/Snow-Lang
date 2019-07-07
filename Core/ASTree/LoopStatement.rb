require_relative 'ASTBranch'

class LoopStatement < ASTBranch
    def condition
        return child(0)
    end
    def loop_statement
        return child(1)
    end
    def test(level, tag)
        debug_log(level, tag, "LoopStatement")
        condition.test(level + 1, "condition")
        loop_statement.test(level + 1, "while")
    end
end