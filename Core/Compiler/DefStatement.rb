require_relative '../Instruction/FuncInstruction'
require_relative '../Instruction/MoveInstruction'

class DefStatement
    def compile(code, out_env)
        entry = code.position
        env = VMEnvironment.new(out_env)
        compile_params(code, env)
        save_context(code)
        body.compile(code, env)
        save_return_value(code)
        restore_context(code)
        ReturnInstruction.new(name.name).encode(code)
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
    def save_context(code)
        save = SaveInstruction.new(name.name)
        save.args_num = params.size
        save.encode(code)
    end
    def save_return_value(code)
        store = StoreInstruction.new
        store.set_offset(0) #reuse the first param offset
        store.encode(code)
    end
    def restore_context(code)
        restore = RestoreInstruction.new(name.name)
        restore.args_num = params.size
        restore.encode(code)
    end
end