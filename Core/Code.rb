class Code
    attr_accessor :next_reg
    attr_reader :code
    attr_accessor :next_offset

    def initialize
        @code = Array.new
        @code_size = 0
        @next_reg = 0
        @next_offset = 0
        @symbols = {} # TODO: move symbols into a new env class for compile
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
    def obtain_symbol_index(name)
        if not @symbols.key? name
            @symbols[name] = @next_offset
            @next_offset += 1
        end
        @symbols[name]
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