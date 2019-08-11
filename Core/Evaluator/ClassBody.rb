class ClassBody
    def eval(env)
        i = 0
        while i < childrenAmount do
            member = child(i)
            member.eval(env)
            i += 1
        end
    end
end