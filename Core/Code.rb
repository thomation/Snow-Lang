class Code
    def initialize
        @code = Array.new
        @next_reg = 0
    end
    def add(value)
        @code << value
    end
    def next_reg
        @next_reg
    end
    def next_reg=(att)
        @next_reg=att
    end
    def code
        @code
    end
    def test
        puts "IL Code >>>>>>>>>>>>>>>>>>>>>>"
        puts @code
        puts "IL Code <<<<<<<<<<<<<<<<<<<<<<"
    end
end