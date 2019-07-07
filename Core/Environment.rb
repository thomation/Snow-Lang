class Environment
    def initialize
        @names = Hash.new
    end
    def get(name)
        return @names[name]
    end
    def put(name, value)
        return @names[name] = value
    end
end