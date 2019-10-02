require_relative 'Opcode'
require_relative '../VMDefine'

class Instruction
    def initialize
        @id = 0
        @desc = ""
    end
    def encode(code_seg)
        @code_seg = code_seg
    end
    def decode(vm_segs, vm_regs)
        @vm_segs = vm_segs
        @vm_regs = vm_regs
        VMDefine::UNDEFINED_ERROR
    end
    def encode_register(reg)
        raise "There's no more Reg for #{reg}" if reg >= VMDefine::NUM_OF_REG
        "r#{reg}"
        #- reg - 1
    end
    def decode_register(operand)
        #-1 - operand
        operand[1, operand.length - 1].to_i
    end
    def encode_offset(offset)
        offset
    end
    def decode_offset(operand)
        operand
    end
    def register?(operand)
        operand < 0
    end
    def offset?(operand)
        operand >= 0
    end
    def offset_placeholder
        encode_offset(0)
    end
    def to_s
        @desc
    end
end