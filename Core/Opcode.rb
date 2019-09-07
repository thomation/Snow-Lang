module Opcode
    ICONST = "iconst: v->r"
    BCONST = "bconst"
    SCONST = "sconst"
    ADD = "add: r1, r2->r1"
    SUB = "sub: r1, r2->r1"
    MUL = "mul: r1, r2->r1"
    DIV = "div: r1, r2->r1"
    REM = "rem: r1, r2->r1"
    EQUAL = "equal"
    MORE = "more"
    LESS = "less"

    def encode_register(reg)
        - reg - 1
    end
    def decode_register(operand)
        -1 - operand
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
end