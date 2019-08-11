module Postfix
    def parse_args(lexer)
        i = 0
        left = 0
        right = 0
        args = Array.new
        while t = lexer.peek(0) do
            lexer.first! if t.is_a? SepToken
            left += 1 if t.is_a? SepToken and t.text == SepToken.left
            right +=1 if t.is_a? SepToken and t.text == SepToken.right
            break if left == right
            args << ExprParser.new.parse(lexer)
        end
        args
    end
end