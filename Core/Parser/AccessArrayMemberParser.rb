require_relative 'Parser'
require_relative 'ExprParser'
require_relative '../ASTree/AccessArrayMemberStatement'

#access_array_member = IDENTIFIER, "[", expr, "]"

class AccessArrayMemberParser < Parser
    def parse(lexer)
        AccessArrayMemberStatement.new([Name.new(lexer.first!), parse_access_key(lexer)])
    end
    def parse_access_key(lexer)
        lexer.first!
        expr = ExprParser.new.parse(lexer)
        lexer.first!
        return expr
    end
end