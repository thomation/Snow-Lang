require_relative 'ASTNode'

class ASTLeaf < ASTNode
    def initialize(token)
        @token = token
    end
    def token
        return @token
    end
    def test
        puts "ASTLeaf:"
        @token.test
    end
end