class CallStatement
    def eval(outer_env)
        f = outer_env.get(name.name)
        raise "undefined name #{name.name}" unless f
        if f.is_a? NativeFunction
            eval_native_func()
        else
            eval_func(outer_env, f)
        end
    end
    def eval_native_func()
    end
    def eval_func(outer_env, f)
        i = 0
        env = f.make_env
        while i < f.params.size do
            env.put_new(f.params.name(i).name, arg(i).eval(outer_env))
            i += 1
        end
        f.body.eval(env)
    end
end