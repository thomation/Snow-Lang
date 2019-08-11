require_relative 'Parser'
require_relative 'Postfix'
require_relative '../ASTree/CallStatement'
require_relative '../ASTree/Name'
require_relative '../Token/Token'
require_relative 'ExprParser'

#call -> IDENTIFIER "("[args]")"
#args ->  expr {"," expr}

class CallParser < Parser
    include Postfix
    def parse(lexer)
        CallStatement.new([Name.new(lexer.first!)] + parse_args(lexer))
    end
end