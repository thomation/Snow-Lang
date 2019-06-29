require_relative 'ASTNode'

class ASTBranch < ASTNode
    def initialize(nodes)
        @nodes = nodes
    end
    def child(index)
        return @nodes[index]
    end
    def test
        puts "ASTBranch"
        @nodes.each{|node| node.test}
    end
end