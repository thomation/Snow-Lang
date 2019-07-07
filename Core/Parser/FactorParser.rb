require_relative 'Parser'
require_relative 'PrimaryParser'
require_relative '../ASTree/NegativeExpr'
require_relative '../ASTree/PrimaryExpr'


#factor -> "-" primary | primary

class FactorParser < Parser
    def parse(lexer)
        token = lexer.peek(0)
        #puts "Factor : #{token.text}"
        if token.is_a? OpToken and token.text == "-"
            parse_minus(lexer)
        else
            parse_primary(lexer)
        end
    end
    def parse_minus(lexer)
        lexer.first!
        return NegativeExpr.new([parse_primary(lexer)])
    end
    def parse_primary(lexer)
        return PrimaryParser.new.parse(lexer)
    end
end