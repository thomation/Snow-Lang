require_relative 'ASTLeaf'

class Name < ASTLeaf
    def name
        return token.text
    end
    def test(level, tag)
        debug_log(level, tag, "Name: #{name}")
    end
end