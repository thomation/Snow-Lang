require_relative 'Parser'
require_relative 'ExprParser'
require_relative '../ASTree/NumberLiteral'
require_relative '../ASTree/PrimaryExpr'

#primary -> "(" expr ")" | NUMBER | IDENTIFIER | STRING

class PrimaryParser < Parser
    def parse(lexer, head, tail)
        token = lexer.peek(head)
        if token.is_a? SepToken
            parse_sep_expr(lexer, head, tail)
        elsif token.is_a? NumToken
            parse_num(lexer, head)
        end
    end
    def parse_sep_expr(lexer, head, tail)
        open_sep = 1
        close_sep = 0
        i = head + 1
        while open_sep == close_sep and lexer.peek(i) != nil and i < tail do
            token = lexer.peek(i)
            if token.is_a? SepToken
                if token.text == "("
                    open_sep += 1
                end
                if token.text == ")"
                    close_sep += 1
                end
            end
            i += 1
        end
        expr = ExprParser.new.parse(lexer, head + 1, i - 1)
        return PrimaryExpr.new([Name.new("("), expr, Name.new(")")])
    end
    def parse_num(lexer, head)
        return NumberLiteral.new(lexer.peek(head))
    end
    def parse_id(lexer)
    end
    def parse_string(lexer)
    end
end