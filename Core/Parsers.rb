require_relative './Parser/ProgramParser'

class Parsers
    def parse(lexer)
        return ProgramParser.new.parse(lexer)
    end
end