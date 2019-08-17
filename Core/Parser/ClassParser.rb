require_relative 'Parser'
require_relative 'ClassBodyParser'
require_relative '../ASTree/ClassStatement'

#defclass -> "class" IDENTIFIER ["extends" IDENTIFIER] class_body

class ClassParser < Parser
    def parse(lexer)      
        lexer.first!
        class_name = Name.new(lexer.first!)
        if (token = lexer.peek(0)).is_a? KeyToken and token.text == "extends"
            lexer.first!
            super_name = Name.new(lexer.first!)
            return ClassStatement.new([class_name, ClassBodyParser.new.parse(lexer), super_name])
        end
        return ClassStatement.new([class_name, ClassBodyParser.new.parse(lexer)])
    end
end