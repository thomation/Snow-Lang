require_relative '../Instruction/ComputeInstruction'
class BinaryExpr
    def compile(code)
        op = operator.value
        if op == "="
            right.compile(code)
            left.compute_assign(code)
        else
        	left.compile(code)
            right.compile(code)
            op_obj = get_opcode(op)
            op_obj.encode(code)
        end
    end
    def get_opcode(op)
        case op
        when "+" then return AddInstruction.new
        when "-" then return SubInstruction.new
        when "*" then return MulInstruction.new
        when "/" then return DivInstruction.new
        # when ">" then return MoreInstruction.new
        # when "<" then return LessInstruction.new
        else
            raise "Invalid operator #{op}"
        end
    end
end