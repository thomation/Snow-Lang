class CallStatement
    def eval(env)
        f = env.get(name.name)
        raise "undefined name #{name.name}" unless f
        i = 0
        while i < f.params.size do
            env.put(f.params.name(i).name, arg(i).eval(env))
            i += 1
        end
        f.body.eval(env)
    end
end