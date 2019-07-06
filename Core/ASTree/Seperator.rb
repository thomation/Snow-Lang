require_relative 'ASTLeaf'

class Seperator < ASTLeaf
    def value
        return token.text
    end
    def test(level, tag)
        debug_log(level, tag, "Seperator: #{value}")
    end
end