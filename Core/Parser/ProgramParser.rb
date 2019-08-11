require_relative 'Parser'
require_relative 'StatementParser'
require_relative 'DefParser'
require_relative 'ClassParser'

#program -> [classdef | def | statement] EOL

class ProgramParser < Parser
    #EOF is removed by lexer
    def parse(lexer)
        first = lexer.peek(0)
        if first.is_a? KeyToken
            return DefParser.new.parse(lexer) if first.text == "def"
            return ClassParser.new.parse(lexer) if first.text == "class"
        end
        return StatementParser.new.parse(lexer)
    end
end