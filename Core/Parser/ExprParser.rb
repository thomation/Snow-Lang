require_relative 'Parser'

require_relative 'FactorParser'
require_relative 'ExprParser'
require_relative '../ASTree/BinaryExpr'
require_relative '../ASTree/Name'

#expr -> factor {OP factor}

class ExprParser < Parser
    def parse(lexer)
        index = find_op(lexer)
        #puts "index of op #{index}"
        # TODO: +- or */ priority
        if(index > 0)
            left = FactorParser.new.parse(lexer)
            op =  Name.new(lexer.fetch_first)
            right = ExprParser.new.parse(lexer)
            return BinaryExpr.new([left, op, right])
        else
            # - is not a OP but a part of factor
            return FactorParser.new.parse(lexer)
        end
    end
    def find_op(lexer)
        i = 0
        line_no = lexer.peek(0).line_no
        while (token = lexer.peek(i)) != nil and token.line_no == line_no and token.text != ")" do
            #token.test
            if token.is_a? OpToken
                return i
            end
            i += 1
        end
        return 0
    end
end