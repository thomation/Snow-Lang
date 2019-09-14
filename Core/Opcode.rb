Dir[File.dirname(__FILE__) + '/Instruction/*.rb'].each {|file| require file }
module Opcode
    ICONST = ConstInstruction.new
    BCONST = "bconst"
    SCONST = "sconst"
    IFZERO = IfZeroInstruction.new
    GOTO = GotoInstruction.new
    NEG = NegInstruction.new
    ADD = AddInstruction.new
    SUB = SubInstruction.new
    MUL = MulInstruction.new
    DIV = DivInstruction.new
    REM = RemInstruction.new
    EQUAL = "equal"
    MORE = "more"
    LESS = "less"
end