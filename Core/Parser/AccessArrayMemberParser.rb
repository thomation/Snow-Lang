require_relative 'Parser'
require_relative 'ExprParser'
require_relative '../ASTree/AccessArrayMemberStatement'

#access_array_member = IDENTIFIER, "[", expr, "]"

class AccessArrayMemberParser < Parser
    def parse(lexer, right_boundary)
        AccessArrayMemberStatement.new([Name.new(lexer.first!), parse_accessor(lexer, right_boundary)])
    end
    def parse_accessor(lexer, right_boundary)
        lexer.first!
        expr = ExprParser.new.parse(lexer, right_boundary)
        lexer.first!
        return expr
    end
end