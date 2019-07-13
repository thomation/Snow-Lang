require_relative 'Parser'
require_relative 'ExprParser'
require_relative 'CallParser'
require_relative '../ASTree/NumberLiteral'
require_relative '../ASTree/StringLiteral'
require_relative '../ASTree/Name'
require_relative '../ASTree/PrimaryExpr'
require_relative '../AStree/Seperator'

#primary -> "(" expr ")" | NUMBER | IDENTIFIER | STRING | call

class PrimaryParser < Parser
    def parse(lexer)
        token = lexer.peek(0)
        if token.is_a? SepToken and token.text == SepToken.left
            return parse_sep_expr(lexer)
        elsif token.is_a? NumToken
            return parse_num(lexer)
        elsif token.is_a? IdToken
            return parse_id(lexer)
        elsif token.is_a? StrToken
            return parse_string(lexer)   
        end
        raise "Cannot parse primary with #{token.text}"
    end
    def parse_sep_expr(lexer)
        open_sep = 1
        close_sep = 0
        line_no = lexer.peek(0).line_no
        i = 0
        while open_sep != close_sep and (token = lexer.peek(i)) != nil and token.line_no == line_no do
            if token.is_a? SepToken
                if token.text == SepToken.left
                    open_sep += 1
                end
                if token.text == SepToken.right
                    close_sep += 1
                end
            end
            i += 1
        end
        left = lexer.first!
        expr = ExprParser.new.parse(lexer)
        right = lexer.first!
        return PrimaryExpr.new([Seperator.new(left), expr, Seperator.new(right)])
    end
    def parse_num(lexer)
        return NumberLiteral.new(lexer.first!)
    end
    def parse_id(lexer)
        token = lexer.peek(1)
        if token and token.is_a? SepToken and token.text == SepToken.left
            return CallParser.new.parse(lexer)
        end
        return Name.new(lexer.first!)
    end
    def parse_string(lexer)
        return StringLiteral.new(lexer.first!)
    end
end