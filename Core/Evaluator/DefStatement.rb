class DefStatement < ASTBranch
    def eval(env)
        raise "Duplicated name: #{name.name}"if env.get(name.name)
        env.put(name.name, self)
        return 0
    end
end