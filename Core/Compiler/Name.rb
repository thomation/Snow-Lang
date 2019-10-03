require_relative '../Instruction/MoveInstruction'

class Name
    def compile(code, env)
        w = where(env, name)
        load = w.global? ? GLoadInstruction.new : LoadInstruction.new
        load.set_offset(w.obtain_symbol_index(name))
        load.encode(code)
    end
    def where(env, name)
        w = env.where(name)
        w = env unless w
        w
    end
    def compute_assign(code, env)
        w = where(env, name)
        store = w.global? ? GStoreInstruction.new : StoreInstruction.new
        store.set_offset(w.obtain_symbol_index(name))
        store.encode(code)
    end
end