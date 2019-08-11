require_relative '../Objects/SnowClass'

class ClassStatement
    def eval(env)
        c = SnowClass.new(self, env)
        env.put_new(name.name, c)
        return c
    end
end