require_relative 'ASTBranch'

class PrimaryExpr < ASTBranch
    def test(level, tag)
        debug_log(level, tag, "Primary")
        @nodes.each{|node| node.test(level + 1, "child")}
    end
end