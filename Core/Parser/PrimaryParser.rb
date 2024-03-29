require_relative 'Parser'
require_relative 'ExprParser'
require_relative 'CallParser'
require_relative 'AccessClassMemberParser'
require_relative 'ClosureParser'
require_relative 'ArrayParser'
require_relative "AccessArrayMemberParser"
require_relative '../ASTree/NumberLiteral'
require_relative '../ASTree/StringLiteral'
require_relative '../ASTree/Name'
require_relative '../ASTree/PrimaryExpr'
require_relative '../AStree/Seperator'

#primary = "(", expr, ")" | NUMBER | IDENTIFIER | STRING | call | closure | access_class_member | array | access_array_member;

class PrimaryParser < Parser
    def parse(lexer, right_boundary)
        token = lexer.peek(0)
        if token.is_a? SepToken
            if token.text == SepToken.left
                return parse_sep_expr(lexer, right_boundary)
            elsif token.text == "["
                return parse_array(lexer, right_boundary)
            end
        elsif token.is_a? NumToken
            return parse_num(lexer, right_boundary)
        elsif token.is_a? IdToken
            return parse_id(lexer, right_boundary)
        elsif token.is_a? StrToken
            return parse_string(lexer, right_boundary)
        elsif token.is_a? KeyToken and token.text == "fun"
            return parse_closure(lexer, right_boundary)
        end
        raise "Cannot parse primary with #{token.text}"
    end
    def parse_sep_expr(lexer, right_boundary)
        open_sep = 1
        close_sep = 0
        line_no = lexer.peek(0).line_no
        i = 0
        while open_sep != close_sep and (token = lexer.peek(i)) != nil and token.line_no == line_no and i < right_boundary do
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
        expr = ExprParser.new.parse(lexer, lexer.current_index + i)
        right = lexer.first!
        return PrimaryExpr.new([Seperator.new(left), expr, Seperator.new(right)])
    end
    def parse_array(lexer, right_boundary)
        return ArrayParser.new.parse(lexer, right_boundary)
    end
    def parse_num(lexer, right_boundary)
        return NumberLiteral.new(lexer.first!)
    end
    def parse_id(lexer, right_boundary)
        token = lexer.peek(1)
        return CallParser.new.parse(lexer, right_boundary) if token and token.is_a? SepToken and token.text == SepToken.left
        return AccessClassMemberParser.new.parse(lexer, right_boundary) if token and token.is_a? AccessToken and token.text == "."
        return AccessArrayMemberParser.new.parse(lexer, right_boundary) if token and token.is_a? SepToken and token.text == "["
        return Name.new(lexer.first!)
    end
    def parse_string(lexer, right_boundary)
        return StringLiteral.new(lexer.first!)
    end
    def parse_closure(lexer, right_boundary)
        return ClosureParser.new.parse(lexer, right_boundary)
    end
end