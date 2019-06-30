require_relative 'Parser'
require_relative 'ExprParser'
require_relative '../ASTree/NumberLiteral'
require_relative '../ASTree/PrimaryExpr'

#primary -> "(" expr ")" | NUMBER | IDENTIFIER | STRING

class PrimaryParser < Parser
    def parse(lexer)
        token = lexer.peek(0)
        if token.is_a? SepToken
            parse_sep_expr(lexer)
        elsif token.is_a? NumToken
            parse_num(lexer)
        end
    end
    def parse_sep_expr(lexer)
        open_sep = 1
        close_sep = 0
        line_no = lexer.peek(0).line_no
        i = 0
        while open_sep != close_sep and (token = lexer.peek(i)) != nil and token.line_no == line_no do
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
        lexer.fetch_first
        expr = ExprParser.new.parse(lexer)
        return PrimaryExpr.new([Name.new("("), expr, Name.new(")")])
    end
    def parse_num(lexer)
        num =  NumberLiteral.new(lexer.fetch_first)
    end
    def parse_id(lexer)
    end
    def parse_string(lexer)
    end
end