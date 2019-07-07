require_relative 'ASTLeaf'

class StringLiteral < ASTLeaf
    def value
        return @token.text
    end
    def test(level, tag)
        debug_log(level, tag, "StringLiteral: #{value.to_s}")
    end
end