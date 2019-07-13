class DefStatement < ASTBranch
    def eval(env)
        if env.get(name) then
            raise "Duplicated name: #{name}" 
        end
        env.put(name, self)
        return 0
    end
end