require_relative 'ASTLeaf'

class Name < ASTLeaf
    def initialize(token, local = false)
        super(token)
        @local = local
    end
    def name
        return token.text
    end
    def local?
        @local
    end
    def test(level, tag)
        debug_log(level, tag, "Name: #{name}")
        debug_log(level, tag, "Local: #{local?}")
    end
end