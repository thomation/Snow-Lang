require_relative './Parser/ExprParser'

class Parsers
    def parse(lexer)
        puts "start parse 0 #{lexer.length}"
        return ExprParser.new.parse(lexer, 0, lexer.length)
    end
end