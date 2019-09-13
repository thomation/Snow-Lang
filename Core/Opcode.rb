module Opcode
    ICONST = "iconst: v->r"
    BCONST = "bconst"
    SCONST = "sconst"
    IFZERO ="ifzero: r, pc offset -> r==0? goto pc offset"
    GOTO = "goto: pc offset -> goto pc offset"
    NEG = "neg: r -> r"
    ADD = "add: r1, r2->r1"
    SUB = "sub: r1, r2->r1"
    MUL = "mul: r1, r2->r1"
    DIV = "div: r1, r2->r1"
    REM = "rem: r1, r2->r1"
    EQUAL = "equal"
    MORE = "more"
    LESS = "less"

    def encode_register(reg)
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
end