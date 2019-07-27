require_relative '../Environment'
class CallStatement
    def eval(outer_env)
        f = outer_env.get(name.name)
        raise "undefined name #{name.name}" unless f
        i = 0
        env = Environment.new(outer_env)
        while i < f.params.size do
            env.put_new(f.params.name(i).name, arg(i).eval(outer_env))
            i += 1
        end
        f.body.eval(env)
    end
end