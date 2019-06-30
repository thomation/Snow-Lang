require_relative 'ASTNode'

class ASTLeaf < ASTNode
    def initialize(token)
        @token = token
    end
    def token
        return @token
    end
    def test(level, tag)
        debug_log(level, tag, "ASTLeaf #{@token.debug_s}")
    end
end