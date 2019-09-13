class Code
    attr_accessor :next_reg
    attr_reader :code

    def initialize
        @code = Array.new
        @next_reg = 0
    end
    def add(value)
        @code << value
    end
    def test
        puts "IL Code >>>>>>>>>>>>>>>>>>>>>>"
        puts @code
        puts "IL Code <<<<<<<<<<<<<<<<<<<<<<"
    end
end