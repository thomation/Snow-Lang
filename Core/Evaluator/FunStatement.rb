require_relative '../Objects/Function'

class FunStatement
    def eval(env)
        return Function.new(params, body, env)
    end
end