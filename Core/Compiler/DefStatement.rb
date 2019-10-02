require_relative '../Instruction/FuncInstruction'
require_relative '../Instruction/MoveInstruction'

class DefStatement
    def compile(code, out_env)
        entry = code.position
        env = VMEnvironment.new(out_env)
        compile_params(code, env)
        SaveInstruction.new
        body.compile(code, env)
        StoreInstruction.new
        RestoreInstruction.new
        ReturnInstruction.new
        f = VMFunction.new(params, body, env, entry)
        out_env.put_new(name.name, f)
        f
    end
    def compile_params(code, env)
        i = 0
        while i < params.size
            symbol = params.name(i)
            env.obtain_symbol_index(symbol)
            i += 1
        end
        params.size
    end
end