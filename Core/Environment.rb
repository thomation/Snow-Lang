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
    attr_reader :root
    attr_accessor :frame_size

    def initialize(outer)
        super(outer)
        @next_index = 0
        @root = -1
        @frame_size = 0
    end
    def global?
        @outer == nil
    end
    def obtain_symbol_index(name)
        unless get_local(name)
            put_new(name, @next_index + @frame_size)
            @next_index += 1
        end
        get_local(name)
    end
    def put_new(name, value)
        super
        @root = value.entry if value.is_a? VMFunction and name == "main"
    end
end