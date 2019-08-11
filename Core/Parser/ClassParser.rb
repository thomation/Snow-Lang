require_relative 'Parser'
require_relative 'ClassBodyParser'
require_relative '../ASTree/ClassStatement'

#defclass -> "class" IDENTIFIER ["extends" IDENTIFIER] class_body

class ClassParser < Parser
    def parse(lexer)      
        lexer.first!
        return ClassStatement.new([Name.new(lexer.first!), ClassBodyParser.new.parse(lexer)])
    end
end