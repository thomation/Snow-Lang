require_relative 'ASTLeaf'

class Operator < ASTLeaf
    def value
        return token.text
    end
    def test(level, tag)
        debug_log(level, tag, "Operator: #{value}")
    end
end