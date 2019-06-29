require_relative 'ASTNode'

class ASTBranch < ASTNode
    def initialize(nodes)
        @nodes = nodes
    end
    def child(index)
        return @nodes[index]
    end
end