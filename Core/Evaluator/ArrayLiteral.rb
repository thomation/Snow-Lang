require_relative '../Objects/SnowArray'

class ArrayLiteral
    def eval(env)
        elements = Array.new
        i = 0;
        while i < size do
            elements << element(i).eval(env)
            i += 1
        end
        return SnowArray.new(elements)
    end
end