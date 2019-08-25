require_relative 'Parser'
require_relative '../ASTree/ParamsList'
require_relative '../ASTree/Name'
require_relative '../Token/Token'

#params = IDENTIFIER, {",", IDENTIFIER};

class ParamsParser < Parser
    def parse(lexer, right_boundary)
        ids  = parse_ids(lexer, right_boundary)
        ParamsList.new(ids)
    end
    def parse_ids(lexer, right_boundary)
        ids = Array.new
        while token = lexer.peek(0) and token.text != SepToken.open and !lexer.over? right_boundary do
            if !token.is_a? SepToken
                ids << Name.new(token)
            end
            lexer.first!
        end
        ids
    end
end