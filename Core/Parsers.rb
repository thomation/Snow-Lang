require_relative './Parser/ProgramParser'

class Parsers
    def parse(lexer, right_boundary)
        return ProgramParser.new.parse(lexer, right_boundary)
    end
end