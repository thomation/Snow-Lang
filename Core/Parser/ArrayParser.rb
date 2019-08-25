require_relative 'Parser'
require_relative '../ASTree/ArrayLiteral'

#array = "[", elements,"]"
#elements = expr, {",", expr}

class ArrayParser < Parser
    def parse(lexer, right_boundary)
        lexer.first!
        elements = Array.new
        open = 1
        close = 0
        while t = lexer.peek(0) and !lexer.over? right_boundary do
            open += 1 if t.is_a? SepToken and t.text == "["
            close += 1 if t.is_a? SepToken and t.text == "]"
            break if open == close
            lexer.first! if t.is_a? SepToken and t.text == SepToken.mid
            elements << ExprParser.new.parse(lexer, right_boundary)
        end
        lexer.first!
        return ArrayLiteral.new(elements)
    end
end