class NumToken < Token
    def number
        if @value =~ /\./
            return @value.to_f
        end
        return @value.to_i
    end
end