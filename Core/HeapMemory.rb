class HeapMemory
    def initialize(size)
        @size = size
        @data = Array.new(size)
    end
    def read(offset)
        check(offset)
        @data[offset]
    end
    def check(offset)
        raise "out of heap memory #{offset} >= #{@size}" if offset >= @size
    end
    def write(offset, value)
        check(offset)
        @data[offset] = value
    end
end