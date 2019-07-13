require_relative 'Parser'
require_relative 'ParamsParser'
require_relative 'BlockParser'
require_relative '../ASTree/DefStatement'

#def -> "def" IDENTIFIER "("[params]")" block

class DefParser < Parser
    def parse(lexer)      
        lexer.first!
        return DefStatement.new([Name.new(lexer.first!), ParamsParser.new.parse(lexer), BlockParser.new.parse(lexer)])
    end
end