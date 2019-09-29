require_relative '../Instruction/MoveInstruction'

class Name
    def compile(code)
        load = LoadInstruction.new
        load.set_offset(code.obtain_symbol_index(name))
        load.encode(code)
    end
    def compute_assign(code)
        store = StoreInstruction.new
        store.set_offset(code.obtain_symbol_index(name))
        store.encode(code)
    end
end