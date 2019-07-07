require_relative 'ASTBranch'

class Block < ASTBranch
    def test(level, tag)
        debug_log(level, tag, "Block")
        debug_log(level, tag, "{")
        @nodes.each{|node| node.test(level + 1, "statement")}
        debug_log(level, tag, "}")
    end
end