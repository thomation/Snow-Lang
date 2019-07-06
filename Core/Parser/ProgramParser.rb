require_relative 'Parser'
require_relative 'StatementParser'
#program -> [statemen] EOL

class ProgramParser < Parser
    #EOF is removed by lexer
    def parse(lexer)
        return StatementParser.new.parse(lexer)
    end
end