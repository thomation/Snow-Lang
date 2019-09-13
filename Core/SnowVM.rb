require_relative 'Opcode'
class SnowVM
	include Opcode

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
	end
	
	def main_loop
		op = @code[@pc]
		puts "Handle OP:#{op}"
		case op
		when ICONST then
			@registers[decode_register(@code[@pc + 2])] = @code[@pc + 1]
			@pc += 3
		when IFZERO then
			v = @registers[decode_register(@code[@pc + 1])]
			if v == 0
				@pc += @code[@pc + 2]
			else
				@pc += 3
			end
		when GOTO then
			@pc += @code[@pc + 1]
		when NEG then
			r = decode_register(@code[@pc + 1])
			v = @registers[r]
			@registers[r] = -v
			@pc += 2
		when ADD then compute_number(ADD)
		when SUB then compute_number(SUB)
		when MUL then compute_number(MUL)
		when DIV then compute_number(DIV)
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
		when SUB then v3 = v1 - v2	
		when MUL then v3 = v1 * v2
		when DIV then v3 = v1 / v2
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