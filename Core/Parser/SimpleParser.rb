require_relative 'Parser'
require_relative 'ExprParser'

#simple = expr;
class SimpleParser < Parser
    def parse(lexer, right_boundary)
        return ExprParser.new.parse(lexer, right_boundary)
    end
end