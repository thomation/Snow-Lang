require_relative './Parser/ExprParser'

class Parsers
    def parse(lexer)
        return ExprParser.new.parse(lexer)
    end
end