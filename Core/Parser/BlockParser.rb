require_relative 'Parser'
require_relative '../ASTree/Block'

#block =  "{", [statement], {EOL, [statement]}, "}";

class BlockParser < Parser
    def parse(lexer, right_boundary)
        lexer.first!
        statements = Array.new
        while t = lexer.peek(0) and !lexer.over? right_boundary do
            if t.is_a? SepToken and t.text == SepToken.close
                break
            end
            statements << StatementParser.new.parse(lexer, right_boundary)
        end
        lexer.first!
        return Block.new(statements)
    end
end