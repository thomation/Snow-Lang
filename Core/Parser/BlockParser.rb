require_relative 'Parser'
require_relative '../ASTree/Block'

#block ->  "{" [statement] { EOL [statement] } "}" 
class BlockParser < Parser
    def parse(lexer)
        lexer.first!
        statements = Array.new
        while t = lexer.peek(0) do
            if t.is_a? SepToken and t.text == SepToken.close
                break
            end
            statements << StatementParser.new.parse(lexer)
        end
        lexer.first!
        return Block.new(statements)
    end
end