require_relative 'Parser'

require_relative 'FactorParser'
require_relative 'ExprParser'
require_relative '../ASTree/BinaryExpr'
require_relative '../ASTree/Operator'

#expr -> factor {OP factor}

class ExprParser < Parser
    @@expr_setting = {
        "*" => {:prio => 1,},
        "/" => {:prio => 1,},
        "+" => {:prio => 2,},
        "-" => {:prio => 2,},
        ">" => {:prio => 3,},
        ">=" => {:prio => 3,},
        "<" => {:prio => 3,},
        "<=" => {:prio => 3,},
        "==" => {:prio => 3,},
        "not" => {:prio => 4,},
        "and" => {:prio => 5,},
        "or" => {:prio => 6,},
        "=" => {:prio => 8,},
    }
    @@stop_token = [SepToken.right, SepToken.open, SepToken.mid]
    def parse(lexer)
        all_index = find_binary_ops(lexer)
        if all_index.length <= 0 
            return FactorParser.new.parse(lexer)
        end
        return parse_binary(all_index, lexer)
    end
    def find_binary_ops(lexer)
        i = 1
        ret = []
        line_no = lexer.peek(0).line_no
        while (token = lexer.peek(i)) != nil and token.line_no == line_no and !@@stop_token.include? token.text do
            if token.is_a? OpToken
                ret << i
            end
            i += 1
        end
        return ret
    end
    def parse_binary(all_index, lexer)
        factors = []
        ops = []
        all_index.each do |index|
            factors << FactorParser.new.parse(lexer)
            ops << Operator.new(lexer.first!)
        end
        factors << FactorParser.new.parse(lexer)
        return create_binary_tree(ops, factors, 0, ops.length)
    end
    def create_binary_tree(ops, factors, head, tail)
        if head + 1 < tail
            index = find_low_prio_op(ops, head, tail)
            left = create_binary_tree(ops, factors, head, index)
            right = create_binary_tree(ops, factors, index + 1, tail)
            return BinaryExpr.new([left, ops[index], right])
        end
        if head == tail
            return factors[head]
        end
        return BinaryExpr.new([factors[head], ops[head], factors[head + 1]])    
    end
    def find_low_prio_op(ops, head, tail)
        last_prio = 0
        find_index = 0
        i = 0
        while(i < ops.length) do
            prio = @@expr_setting[ops[i].value][:prio]
            if prio > last_prio then
                find_index = i
                last_prio = prio
            end
            i += 1
        end
        return find_index
    end
end