require_relative 'ASTLeaf'

class NumberLiteral < ASTLeaf
    def value
        return @token.number
    end
    def test
        puts "NumberLiteral: #{value.to_s}"
    end
end