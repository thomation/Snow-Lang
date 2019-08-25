require_relative 'Parser'
require_relative 'PrimaryParser'
require_relative '../ASTree/NegativeExpr'
require_relative '../ASTree/PrimaryExpr'


#factor = "-", primary | primary;

class FactorParser < Parser
    def parse(lexer, right_boundary)
        token = lexer.peek(0)
        if token.is_a? OpToken and token.text == "-"
            parse_minus(lexer, right_boundary)
        else
            parse_primary(lexer, right_boundary)
        end
    end
    def parse_minus(lexer, right_boundary)
        lexer.first!
        return NegativeExpr.new([parse_primary(lexer, right_boundary)])
    end
    def parse_primary(lexer, right_boundary)
        return PrimaryParser.new.parse(lexer, right_boundary)
    end
end