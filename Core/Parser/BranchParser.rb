require_relative 'Parser'
require_relative '../ASTree/KeyWord'
require_relative 'ExprParser'
require_relative 'BlockParser'
require_relative '../Token/Token'
require_relative '../ASTree/BranchStatement'

#branch = "if", expr, block, {"elseif", block}, ["else", block];
class BranchParser < Parser
    def parse(lexer, right_boundary)
        children = parse_children(lexer, right_boundary)
        return BranchStatement.new(children)
    end
    def parse_children(lexer, right_boundary)
        children = Array.new
        state = "open"
        while (k = parse_next_key(lexer, state)) != nil do
            state = compute_next_state(k.name)
            c = parse_next_condition(lexer, right_boundary)
            if c != nil
                children << c
            end
            b = parse_next_block(lexer, right_boundary)
            children << b
        end
        return children
    end
    def parse_next_key(lexer, state)
        return nil unless lexer.peek(0) and lexer.peek(0).is_a? KeyToken
        case state
        when "open" then return nil unless lexer.peek(0).text == "if"
        when "mid" then return nil unless lexer.peek(0).text == "else" or lexer.peek(0).text == "elseif"
        when "close" then return nil
        end          
        return KeyWord.new(lexer.first!)
    end
    def compute_next_state(key)
        case key
        when "if" then return "mid"
        when "elseif" then return "mid"
        when "else" then return "close"
        else
            raise "no valid key #{key}"
        end
    end
    def parse_next_condition(lexer, right_boundary)
        return nil if lexer.peek(0).text == SepToken.open
        return ExprParser.new.parse(lexer, right_boundary)
    end
    def parse_next_block(lexer, right_boundary)
        return BlockParser.new.parse(lexer, right_boundary)
    end
end