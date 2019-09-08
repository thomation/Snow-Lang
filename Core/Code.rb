class Code
    def initialize(vm)
        @vm = vm
        @next_reg = 0
    end
    def add(value)
        @vm.code << value
    end
    def next_reg
        @next_reg
    end
    def next_reg=(att)
        @next_reg=att
    end
    def test
        puts "Code >>>>>>>>>>>>>>>>>>>>>>"
        puts @vm.code
        puts "Code <<<<<<<<<<<<<<<<<<<<<<"
    end
end