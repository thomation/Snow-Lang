class BranchStatement
    def eval(env)
        index = 0
        while index * 2 < childrenAmount do
            if is_else?(index) or condition(index).eval(env) != 0
                return branch_statement(index).eval(index)
            end
            index += 1
        end
        return 0
    end
end