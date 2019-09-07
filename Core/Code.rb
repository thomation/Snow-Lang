class Code
    def initialize
        @codes = Array.new
        @next_reg = 0
    end
    def add(value)
        @codes << value
    end
    def test
        puts @codes
    end
    def next_reg
        @next_reg
    end
    def next_reg=(att)
        @next_reg=att
    end
end