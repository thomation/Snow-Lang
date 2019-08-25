module Postfix
    def parse_args(lexer, right_boundary)
        i = 0
        left = 0
        right = 0
        args = Array.new
        while t = lexer.peek(0) and !lexer.over? right_boundary do
            lexer.first! if t.is_a? SepToken
            left += 1 if t.is_a? SepToken and t.text == SepToken.left
            right +=1 if t.is_a? SepToken and t.text == SepToken.right
            break if left == right
            args << ExprParser.new.parse(lexer, right_boundary)
        end
        args
    end
end