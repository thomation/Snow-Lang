require_relative 'Parser'
require_relative 'Postfix'
require_relative '../ASTree/AccessClassMemberStatement'

#access_class_member = IDENTIFIER, ".", IDENTIFIER, {"(", [args], ")"};

class AccessClassMemberParser < Parser
    include Postfix
    def parse(lexer, right_boundary)
        AccessClassMemberStatement.new([Name.new(lexer.first!), parse_member(lexer, right_boundary)] + parse_args(lexer, right_boundary))
    end
    def parse_member(lexer, right_boundary)
        dot = lexer.first!
        return Name.new(lexer.first!)
    end
end

