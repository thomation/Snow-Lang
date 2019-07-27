require_relative 'Function'

class DefStatement < ASTBranch
    def eval(env)
        f = Function.new(params, body, env)
        env.put_new(name.name, f)
        return f
    end
end