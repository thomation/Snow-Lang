class ASTLeaf < ASTNode
    def initialize(token)
        @token = token
    end
    def GetToken
        return token
    end
end