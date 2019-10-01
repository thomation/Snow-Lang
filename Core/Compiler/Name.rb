require_relative '../Instruction/MoveInstruction'

class Name
    def compile(code, env)
        load = LoadInstruction.new
        load.set_offset(env.obtain_symbol_index(name))
        load.encode(code)
    end
    def compute_assign(code, env)
        store = StoreInstruction.new
        store.set_offset(env.obtain_symbol_index(name))
        store.encode(code)
    end
end