require_relative '../Objects/Function'

class FunStatement < ASTBranch
    def eval(env)
        return Function.new(params, body, env)
    end
end