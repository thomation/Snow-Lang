require_relative 'Parser'
require_relative 'SimpleParser'

#statement -> simple | branch | loop
class StatementParser < Parser
    def parse(lexer)
        return parse_simple(lexer)
    end
    def parse_simple(lexer)
        return SimpleParser.new.parse(lexer)
    end
    def parse_branch
    end
    def parse_loop
    end
end