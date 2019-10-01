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
            StoreInstruction.new
            i += 1
        end
        CallInstruction.new
        LoadInstruction.new
    end
end