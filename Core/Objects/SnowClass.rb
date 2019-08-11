class SnowClass
    def initialize(define, env)
        @define = define
        @env = env
    end
    def env
        @env
    end
    def body
        @define.body
    end
end