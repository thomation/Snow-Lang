class Environment
    def initialize
        @names = Hash.new
    end
    def get(name)
        get_local(name)
    end
    def get_local(name)
        @names[name]
    end
    def put_new(name, value)
        @names[name] = value
    end
end
class EmbededEnvironment < Environment
    def initialize(outer)
        super()
        @outer = outer
    end
    def get(name)
        v = get_local(name)
        return v if v != nil or @outer == nil
        return @outer.get(name)
    end
    def put(name, value)
    	e = where(name)
    	e = self if e == nil
    	e.put_new(name, value)
    end
    def where(name)
    	return self if get_local(name) != nil
    	return nil if @outer == nil
    	return @outer.where(name)
    end
    def test
        puts self
        @outer.test if @outer
    end
end
class VMEnvironment < EmbededEnvironment
    def initialize(outer)
        super

    end
end