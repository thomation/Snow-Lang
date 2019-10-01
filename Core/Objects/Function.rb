require_relative '../Environment'
class Function
    def initialize(params, body, env)
        @params = params
        @body = body
        @env = env
    end
    def make_env
        Environment.new(@env)
    end
    def params
        @params
    end
    def body
        @body
    end
end
class VMFunction < Function
    def initialize(params, body, env, entry)
        super(params, body, env)
    end
end