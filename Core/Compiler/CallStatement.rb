require_relative '../Instruction/MoveInstruction'
require_relative '../Instruction/FuncInstruction'

class CallStatement
    def compile(code, outer_env)
        f = outer_env.get(name.name)
        raise "undefined name #{name.name}" unless f
        #TODO: Handle native fuction. Is's also a vmfunction?
        i = 0
        while i < f.params.size do
            arg(i).compile(code, outer_env)
            store = StoreInstruction.new
            store.set_offset(f.get_symbol_index_of_param(i))
            store.encode(code)
            i += 1
        end
        call = CallInstruction.new
        call.args_num = f.params.size
        call.entry = f.entry
        call.encode(code)
        LoadInstruction.new
    end
end