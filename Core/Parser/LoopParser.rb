require_relative 'Parser'
require_relative '../ASTree/LoopStatement'

#loop = "while", expr, block;
class LoopParser < Parser
    def parse(lexer, right_boundary)
        k = parse_key(lexer, right_boundary)
        e = parse_expr(lexer, right_boundary)
        b = parse_block(lexer, right_boundary)
        return LoopStatement.new([e, b])
    end
    def parse_key(lexer, right_boundary)
        return KeyWord.new(lexer.first!)
    end
    def parse_expr(lexer, right_boundary)
        return ExprParser.new.parse(lexer, right_boundary)
    end
    def parse_block(lexer, right_boundary)
        return BlockParser.new.parse(lexer, right_boundary)       
    end
end