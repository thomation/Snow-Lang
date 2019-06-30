require_relative 'ASTLeaf'

class NumberLiteral < ASTLeaf
    def value
        return @token.number
    end
    def test(level, tag)
        debug_log(level, tag, "NumberLiteral: #{value.to_s}")
    end
end