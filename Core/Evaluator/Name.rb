class Name
    def eval(env)
        value = env.get(name)
        if value == nil
            raise "no value of #{name}"
        end
        return value
    end
end