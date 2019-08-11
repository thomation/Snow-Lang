require_relative 'Parser'
require_relative 'Postfix'
require_relative '../ASTree/AccessClassMemberStatement'

#access_class_member -> IDENTIFIER "." IDENTIFIER {"("[args]")"}

class AccessClassMemberParser < Parser
    include Postfix
    def parse(lexer)
        AccessClassMemberStatement.new([Name.new(lexer.first!), parse_member(lexer)] + parse_args(lexer))
    end
    def parse_member(lexer)
        dot = lexer.first!
        return Name.new(lexer.first!)
    end
end

