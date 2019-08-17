class SnowClass
    def initialize(define, env)
        @define = define
        @env = env
        @super_class = env.get(define.super_name.name) if define.has_super
    end
    def env
        @env
    end
    def super_class
        @super_class
    end
    def body
        @define.body
    end
end