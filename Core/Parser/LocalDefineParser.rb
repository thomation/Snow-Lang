require_relative 'Parser'
require_relative '../ASTree/DeclareStatement'

#declare = "local", IDENTIFIER;
#define = declare, "=", expr;

class LocalDefineParser < Parser
    def parse(lexer, right_boundary)
        lexer.first!
        token = lexer.peek(1)
        if token.text == "=" then
            return parse_define(lexer, right_boundary)
        end
        return parse_declare(lexer, right_boundary)
    end
    def parse_define(lexer, right_boundary)
        BinaryExpr.new([Name.new(lexer.first!, true), Operator.new(lexer.first!), ExprParser.new.parse(lexer, right_boundary)])
    end
    def parse_declare(lexer, right_boundary)
        return DeclareStatement.new(lexer.first!)
    end
end