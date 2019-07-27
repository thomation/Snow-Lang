require_relative 'Parser'
require_relative 'ParamsParser'
require_relative 'BlockParser'
require_relative '../ASTree/FunStatement'

#closure -> "fun" "("[params]")" block

class ClosureParser < Parser
    def parse(lexer)      
        lexer.first!
        return FunStatement.new([ParamsParser.new.parse(lexer), BlockParser.new.parse(lexer)])
    end
end