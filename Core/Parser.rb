require_relative './ASTree/ASTLeaf'

class Parser
    def parse(lexer)
        leaf = ASTLeaf.new(lexer.peek(0))
        lexer.next
        return leaf
    end
end