class SnowVM

    def initialize(code, heap_memory)
        @code = code
        @registers = Array.new
        @strings = Array.new
        @stack = Array.new
        @heap_memory = heap_memory
    end

    def run(entry)
        @pc = entry
        @fp = 0
        @sp = 0
        @ret = -1
        while @pc >= 0 and @pc < @code.size do
            main_loop
        end
        if @pc < 0
            raise "You don't implement a decode method"
        end
    end
    
    def main_loop
        op = @code[@pc]
        puts "Handle OP:#{op.to_s} PC == #{@pc}"
        @pc = op.decode({code:@code, reg:@registers, str:@strings, stack:@stack, heap:@heap_memory}, {pc:@pc, sp:@sp, fp:@fp})
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