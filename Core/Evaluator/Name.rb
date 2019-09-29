class Name
    def eval(env)
        value = local? ? env.get_local(name) : env.get(name)
        raise "no value of #{name}" unless value
        return value
    end
end