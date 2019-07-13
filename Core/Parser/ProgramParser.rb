require_relative 'Parser'
require_relative 'StatementParser'
require_relative 'DefParser'

#program -> [def | statement] EOL

class ProgramParser < Parser
    #EOF is removed by lexer
    def parse(lexer)
        first = lexer.peek(0)
        if first.is_a? KeyToken and first.text == "def"
            return DefParser.new.parse(lexer)
        end
        return StatementParser.new.parse(lexer)
    end
end