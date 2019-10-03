require_relative '../Instruction/MoveInstruction'
require_relative '../Instruction/FuncInstruction'

class CallStatement
    def compile(code, outer_env)
        f = outer_env.get(name.name)
        raise "undefined name #{name.name}" unless f
        #TODO: Handle native fuction. Is's also a vmfunction?
        push_args(code, outer_env, f)
        call_func(code, f)
        get_return_value(code, f)
    end
    def push_args(code, outer_env, f)
        i = 0
        while i < f.params.size do
            arg(i).compile(code, outer_env)
            push = PushInstruction.new
            push.encode(code)
            i += 1
        end
    end
    def call_func(code, f)
        call = CallInstruction.new(name.name)
        call.args_num = f.params.size
        call.entry = f.entry
        call.encode(code)
    end
    def get_return_value(code, f)
        i = 0
        old_reg = code.next_reg
        while i < f.params.size do
            code.next_reg = old_reg
            pop = PopInstruction.new
            pop.encode(code)
            i += 1
        end
        #return value is kept in next_reg
    end
end