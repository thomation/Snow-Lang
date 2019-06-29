require_relative 'ASTNode'

class ASTBranch < ASTNode
    def initialize(nodes)
        @nodes = nodes
    end
end