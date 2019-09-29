class DeclareStatement
    def eval(env)
        raise "redeclare #{name}" if env.get_local(name)
        env.put_new(name, 0)
    end
end