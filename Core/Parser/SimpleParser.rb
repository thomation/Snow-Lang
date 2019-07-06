require_relative 'Parser'
require_relative 'ExprParser'

#simple -> expr
class SimpleParser < Parser
    def parse(lexer)
        return ExprParser.new.parse(lexer)
    end
end