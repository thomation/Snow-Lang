require_relative 'Parser'
require_relative '../ASTree/ClassBody'

#class_body -> "{" [member] { EOL [member]} "}"
#member -> def | simple

class ClassBodyParser < Parser
    def parse(lexer)
        lexer.first!
        open = 1
        close = 0
        members = Array.new
        while token = lexer.peek(0) do
            open += 1 if token.text == "{"
            close += 1 if token.text == "}"
            if open == close
                lexer.first!
                return ClassBody.new(members)
            end
            if token.is_a? KeyToken and token.text == "def"
                members << DefParser.new.parse(lexer)
            else
                members << SimpleParser.new.parse(lexer)
            end
        end
        raise "class body does not end"
    end
end