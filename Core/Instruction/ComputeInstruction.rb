require_relative 'Instruction'

class NegInstruction < Instruction
    def initialize
        super
        @id = Opcode::NEG
        @desc = "neg: r -> r"
    end
    def encode(code_seg)
        super
        code_seg.add(self)
        code_seg.add(encode_register(code_seg.next_reg - 1))
    end
    def decode(vm_segs, vm_regs)
        super

        code_seg = vm_segs[:code]
        registers = vm_segs[:reg]
        pc = vm_regs[:pc]

        r = decode_register(code_seg[pc + 1])
        v = registers[r]
        registers[r] = -v

        pc += 2
        pc
    end
end
class BinaryComputeInstruction < Instruction
    def encode(code_seg)
        super
        code_seg.add(self)
        code_seg.add(encode_register(code_seg.next_reg - 2))
        code_seg.add(encode_register(code_seg.next_reg - 1))
        code_seg.next_reg -= 1
    end
    def decode(vm_segs, vm_regs)
        super

        code_seg = @vm_segs[:code]
        registers = @vm_segs[:reg]
        pc = @vm_regs[:pc]

        left = decode_register(code_seg[pc + 1])
        right = decode_register(code_seg[pc + 2])
        v1 = registers[left]
        v2 = registers[right]
        
        v3 = compute(v1, v2)
        registers[left] = v3
        
        pc += 3
        pc
    end
end
class AddInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::ADD
        @desc = "add: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 + v2
    end
end
class SubInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::SUB
        @desc = "sub: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 - v2
    end
end
class MulInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::MUL
        @desc = "mul: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 * v2
    end
end
class DivInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::DIV
        @desc = "div: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 / v2
    end
end
class RemInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::REM
        @desc = "rem: r1, r2->r1"
    end
end
class MoreInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::MORE
        @desc = "More: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 > v2 ? 1 : 0
    end
end
class LessInstruction < BinaryComputeInstruction
    def initialize
        super
        @id = Opcode::LESS
        @desc = "Less: r1, r2->r1"
    end
    def compute(v1, v2)
        v1 < v2 ? 1 : 0
    end
end