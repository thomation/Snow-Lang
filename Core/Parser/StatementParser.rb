require_relative 'Parser'
require_relative 'SimpleParser'
require_relative 'BranchParser'
require_relative 'LoopParser'

#statement = simple | branch | loop;
class StatementParser < Parser
    def parse(lexer, right_boundary)
        token = lexer.peek(0)
        if token.is_a? KeyToken
            case token.text
            when "if"
                return parse_branch(lexer, right_boundary)
            when "while"
                return parse_loop(lexer, right_boundary)
            else
                raise "Invalid keyworkd #{token.text}"
            end
        end
        return parse_simple(lexer, right_boundary)
    end
    def parse_simple(lexer, right_boundary)
        return SimpleParser.new.parse(lexer, right_boundary)
    end
    def parse_branch(lexer, right_boundary)
        return BranchParser.new.parse(lexer, right_boundary)
    end
    def parse_loop(lexer, right_boundary)
        return LoopParser.new.parse(lexer, right_boundary)
    end
end