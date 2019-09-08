require_relative 'Opcode'
class SnowVM
	include Opcode

	def initialize(heap_memory)
		@code = Array.new
		@registers = Array.new
		@strings = Array.new
		@stack = Array.new
		@heap_memory = heap_memory
	end

	def code
        @code
    end
    def code=(att)
        @code=att
    end

	def run(entry)
		@pc = entry
		@fp = 0
		@sp = 0
		@ret = -1
		while @pc >= 0 and @pc < code.size do
			main_loop
		end
	end
	
	def main_loop
		op = @code[@pc]
		case op
		when ICONST then
			@registers[decode_register(@code[@pc + 2])] = @code[@pc + 1]
			@pc += 3
		when ADD then
			compute_number(ADD)
		when MUL then
			compute_number(MUL)
		else
            raise "Invalid operator #{op}"
        end
	end

	def compute_number(op)
		left = decode_register(@code[@pc + 1])
		right = decode_register(@code[@pc + 2])
		v1 = @registers[left]
		v2 = @registers[right]

		v3 = 0
		case op
		when ADD then v3 = v1 + v2
		when MUL then v3 = v1 * v2
		else
      		raise "Invalid operator #{op}"
        end
        @registers[left] = v3
        
        @pc += 3
	end
	def test
		puts "Registers >>>>>>>>>>>>>>>>>>>>>>>>>>"
		puts @registers
		puts "Registers <<<<<<<<<<<<<<<<<<<<<<<<<"
	end
end