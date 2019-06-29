require_relative './ASTree/NumberLiteral'
require_relative './ASTree/Name'
require_relative './ASTree/BinaryExpr'
require_relative './Token/NumToken'

class Parser
    def parse(lexer)
        if lexer.peek(0).is_a? NumToken and lexer.peek(1) != nil
            return parse_binary(lexer)
        end
        if lexer.peek(0).is_a? NumToken
            num = NumberLiteral.new(lexer.peek(0))
            lexer.next
            return num
        end
    end
    def parse_binary(lexer)
        left = lexer.peek(0)
        lexer.next
        op = lexer.peek(0)
        lexer.next
        right = parse(lexer)
        return BinaryExpr.new([NumberLiteral.new(left), Name.new(op), right])
    end
end