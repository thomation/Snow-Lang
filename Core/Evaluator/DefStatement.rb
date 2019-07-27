class DefStatement < ASTBranch
    def eval(env)
        env.put_new(name.name, self)
        return 0
    end
end