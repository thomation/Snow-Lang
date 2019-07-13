require_relative 'Parser'
require_relative '../ASTree/ParamsList'
require_relative '../ASTree/Name'
require_relative '../Token/SepToken'

#params -> IDENTIFIER {"," IDENTIFIER}

class ParamsParser < Parser
    def parse(lexer)
        ids  = parse_ids(lexer)
        ParamsList.new(ids)
    end
    def parse_ids(lexer)
        ids = Array.new
        while token = lexer.peek(0) and token.text != SepToken.open do
            if !token.is_a? SepToken
                ids << Name.new(token)
            end
            lexer.first!
        end
        ids
    end
end