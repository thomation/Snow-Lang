require_relative 'Parser'
require_relative 'SimpleParser'
require_relative 'BranchParser'
require_relative 'LoopParser'

#statement -> simple | branch | loop
class StatementParser < Parser
    def parse(lexer)
        token = lexer.peek(0)
        if token.is_a? KeyToken
            case token.text
            when "if"
                return parse_branch(lexer)
            when "while"
                return parse_loop(lexer)
            else
                raise "Invalid keyworkd #{token.text}"
            end
        end
        return parse_simple(lexer)
    end
    def parse_simple(lexer)
        return SimpleParser.new.parse(lexer)
    end
    def parse_branch(lexer)
        return BranchParser.new.parse(lexer)
    end
    def parse_loop(lexer)
        return LoopParser.new.parse(lexer)
    end
end