class AccessArrayMemberStatement
    def eval(env)
        a = env.get(name.name)
        a.read(access_key.value)
    end
end