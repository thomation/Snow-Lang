require_relative 'Objects/NativeFunction'
class Natives
    def env(env)
        return append_natives(env)
    end
    def append_natives(env)
        env.put_new('print', NativeFunction.new(Proc.new{|args| puts args}))
        return env
    end
end