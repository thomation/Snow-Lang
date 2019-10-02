require_relative 'VMDefine'

class SnowVM

    def initialize(code, heap_memory)
        @code = code
        @registers = Array.new(VMDefine::NUM_OF_REG)
        @strings = Array.new
        @stack = Array.new
        @heap_memory = heap_memory
    end

    def run(entry)
        @special_regs = {pc:entry, fp:0, sp:0, ret:VMDefine::EXIT_RET_ADDR}
        begin
            while @special_regs[:pc] >= 0 and @special_regs[:pc] < @code.size do
                main_loop
            end
            if @special_regs[:pc] < 0
                raise "Error #{@special_regs[:pc]}" unless @special_regs[:pc] == VMDefine::EXIT_RET_ADDR
            end
        rescue StandardError => msg
            test
            raise msg
        end  
    end
    
    def main_loop
        op = @code[@special_regs[:pc]]
        puts "Before OP:#{op.to_s} Regs == #{@special_regs}"
        @special_regs[:pc] = op.decode({code:@code, reg:@registers, str:@strings, stack:@stack, heap:@heap_memory}, @special_regs)
        puts "After OP:#{op.to_s} Regs == #{@special_regs}"
    end

    def test
        puts "Special Registers >>>>>>>>>>>>>>>>>"
        puts @special_regs
        puts "Special Registers <<<<<<<<<<<<<<<<<<"
        puts "Registers >>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts @registers
        puts "Registers <<<<<<<<<<<<<<<<<<<<<<<<<"
        puts "Stack >>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts @stack
        puts "Stack <<<<<<<<<<<<<<<<<<<<<<<<<"
    end
end