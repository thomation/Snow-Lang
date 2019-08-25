class SnowArray
    def initialize(elements)
        @elements = elements
    end
    def read(index)
        @elements[index]
    end
    def write(index, value)
        @elements[index] = value
    end
end