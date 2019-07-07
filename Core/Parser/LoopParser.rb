require_relative 'Parser'
require_relative '../ASTree/LoopStatement'

#loop -> "while" expr block
class LoopParser < Parser
    def parse(lexer)
        k = parse_key(lexer)
        e = parse_expr(lexer)
        b = parse_block(lexer)
        return LoopStatement.new([e, b])
    end
    def parse_key(lexer)
        return KeyWord.new(lexer.first!)
    end
    def parse_expr(lexer)
        return ExprParser.new.parse(lexer)
    end
    def parse_block(lexer)
        return BlockParser.new.parse(lexer)       
    end
end