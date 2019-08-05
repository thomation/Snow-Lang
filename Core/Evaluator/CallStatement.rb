class CallStatement
    def eval(outer_env)
        f = outer_env.get(name.name)
        raise "undefined name #{name.name}" unless f
        if f.is_a? NativeFunction
            eval_native_func(outer_env, f)
        else
            eval_func(outer_env, f)
        end
    end
    def eval_native_func(outer_env, f)
        args = Array.new
        i = 0
        while i < argsAmount do
            args << arg(i).eval(outer_env)
            i += 1
        end
        f.invoke(args)
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