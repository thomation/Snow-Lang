require_relative 'Parser'
require_relative '../ASTree/CallStatement'
require_relative '../ASTree/Name'
require_relative '../Token/SepToken'
require_relative 'ExprParser'

#call -> IDENTIFIER "("[args]")"
#args ->  expr {"," expr}

class CallParser < Parser
    def parse(lexer)
        CallStatement.new([Name.new(lexer.first!)] + parse_args(lexer))
    end
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