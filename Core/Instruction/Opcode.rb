module Opcode
    ICONST = 1
    BCONST = 2
    SCONST = 3
    
    LOAD = 11
    STORE = 12
    PUSH = 13
    POP = 14
    GLOAD = 15
    GSTORE = 16

    GOTO = 21
    IFZERO = 22
    CALL = 23
    RETURN = 24
    SAVE = 25
    RESTORE = 26

    NEG = 32
    ADD = 33
    SUB = 34
    MUL = 35
    DIV = 36
    REM = 37

    EQUAL = 41
    MORE = 42
    LESS = 43
end