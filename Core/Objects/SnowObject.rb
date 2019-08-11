class SnowObject
    def initialize(env)
        @env = env
    end
    def read(member)
        env(member).get(member)
    end
    def write(member, value)
        env(member).put_new(member, value)
    end
    def env(member)
        e = @env.where(member)
        return @env if e and e == @env
        raise "Access error"
    end
end