require_relative 'ASTNode'

class ASTBranch < ASTNode
    def initialize(nodes)
        @nodes = nodes
    end
    def child(index)
        return @nodes[index]
    end
    def test(level, tag)
        debug_log(level, tag, "ASTBranch")
        @nodes.each{|node| node.test(level + 1, tag)}
    end
end