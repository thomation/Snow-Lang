require_relative '../Opcode'
class BinaryExpr
    include Opcode
    def compile(code)
        op = operator.value
    	if op == "="
            
        else
        	left.compile(code)
            right.compile(code)
            op_obj = get_opcode(op)
            op_obj.encode(code)
        end
    end
    def get_opcode(op)
        case op
        when "+" then return ADD
        when "-" then return SUB
        when "*" then return MUL
        when "/" then return DIV
        when ">" then return MORE
        when "<" then return LESS
        else
            raise "Invalid operator #{op}"
        end
    end
end