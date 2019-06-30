require_relative 'Parser'

require_relative 'FactorParser'
require_relative 'ExprParser'
require_relative '../ASTree/BinaryExpr'
require_relative '../ASTree/Name'

#expr -> factor {OP factor}

class ExprParser < Parser
    def parse(lexer, head, tail)
        index = find_op(lexer, head, tail)
        #puts "index of op #{index}"
        # TODO: +- or */ priority
        if(index > head)
            left = FactorParser.new.parse(lexer, head, index)
            op =  Name.new(lexer.peek(index))
            right = ExprParser.new.parse(lexer, index + 1, tail)
            return BinaryExpr.new([left, op, right])
        else
            # - is not a OP but a part of factor
            return FactorParser.new.parse(lexer, head, tail)
        end
    end
    def find_op(lexer, head, tail)
        i = head
        while (token = lexer.peek(i)) != nil and i < tail do
            #token.test
            if token.is_a? OpToken
                return i
            end
            i += 1
        end
        return head
    end
end