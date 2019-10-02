class SnowVM

    def initialize(code, heap_memory)
        @code = code
        @registers = Array.new
        @strings = Array.new
        @stack = Array.new
        @heap_memory = heap_memory
    end

    def run(entry)
        @special_regs = {pc:entry, fp:0, sp:0, ret:-1}
        while @special_regs[:pc] >= 0 and @special_regs[:pc] < @code.size do
            main_loop
        end
        if @special_regs[:pc] < 0
            raise "You don't implement a decode method"
        end
    end
    
    def main_loop
        op = @code[@special_regs[:pc]]
        puts "Handle OP:#{op.to_s} PC == #{@special_regs[:pc]}"
        @special_regs[:pc] = op.decode({code:@code, reg:@registers, str:@strings, stack:@stack, heap:@heap_memory}, @special_regs)
    end

        def test
        puts "Registers >>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts @registers
        puts "Registers <<<<<<<<<<<<<<<<<<<<<<<<<"
        puts "Stack >>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts @stack
        puts "Stack <<<<<<<<<<<<<<<<<<<<<<<<<"
    end
end