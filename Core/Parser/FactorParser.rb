require_relative 'Parser'
require_relative 'PrimaryParser'
require_relative '../ASTree/NegativeExpr'
require_relative '../ASTree/PrimaryExpr'


#factor -> "-" primary | primary

class FactorParser < Parser
    def parse(lexer, head, tail)
        token = lexer.peek(head)
        #puts "Factor : #{token.text}"
        if token.is_a? OpToken and token.text == "-"
            parse_minus(lexer, head, tail)
        else
            parse_primary(lexer, head, tail)
        end
    end
    def parse_minus(lexer, head, tail)
        return NegativeExpr.new(parse_primary(lexer, head + 1, tail))
    end
    def parse_primary(lexer, head, tail)
        return PrimaryParser.new.parse(lexer, head, tail)
    end
end