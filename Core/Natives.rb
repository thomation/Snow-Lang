require_relative 'Evaluator/NativeFunction'
class Natives
    def env(env)
        return append_natives(env)
    end
    def append_natives(env)
        env.put_new('print', NativeFunction.new)
        return env
    end
end