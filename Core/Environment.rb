class Environment
    def initialize(outer)
        @names = Hash.new
        @outer = outer
    end
    def get(name)
        v = @names[name]
        return v if v != nil or @outer == nil
        return @outer.get(name)
    end
    def put_new(name, value)
        @names[name] = value
    end
    def put(name, value)
    	e = where(name)
    	e = self if e == nil
    	e.put_new(name, value)
    end
    def where(name)
    	return self if @names[name] != nil
    	return nil if @outer == nil
    	return @outer.where(name)
    end
    def test
        puts self
        @outer.test if @outer
    end
end