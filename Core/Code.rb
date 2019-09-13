class Code
    attr_accessor :next_reg
    attr_reader :code

    def initialize
        @code = Array.new
        @code_size = 0
        @next_reg = 0
    end
    def position
        @code_size
    end
    def set(value, pos)
        @code[pos] = value
    end
    def add(value)
        @code[@code_size] = value
        @code_size += 1
    end

    def test
        puts "IL Code >>>>>>>>>>>>>>>>>>>>>>"
        i = 0
        @code.each do |code|
            puts "#{i}--\t#{code}"
            i += 1
        end
        puts "IL Code <<<<<<<<<<<<<<<<<<<<<<"
    end
end