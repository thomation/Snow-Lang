module EvalFunc
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