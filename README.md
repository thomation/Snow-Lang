# Snow-Lang

## Token

KEY:     /^(if|else|elseif|while|def)$/

BLOCK:   /^({|})$/

NUMBER : /^[0-9]*\.?[0-9]+$/

OP:      /^(==|>=|<=|=|\+|-|\*|\/|>|<|not|and|or)$/

STRING: /^\".*\"$/

## BNF

### Expression

primary = "(", expr, ")" | NUMBER | IDENTIFIER | STRING | call | closure | access_class_member | array | access_array_member;

factor = "-", primary | primary;

expr = factor, {OP, factor};

### Statement

simple = expr;

branch = "if", expr, block, {"elseif", block}, ["else", block];

loop = "while", expr, block;

statement = simple | branch | loop;

block =  "{", [statement], {EOL, [statement]}, "}";

### Function

params = IDENTIFIER, {",", IDENTIFIER};

def = "def", IDENTIFIER, "(", [params], ")", block;

args =  expr, {",", expr};

call = IDENTIFIER, "(", [args], ")";

closure = "fun", "(", [params], ")", block;

### Class

defclass = "class", IDENTIFIER, ["extends", IDENTIFIER],  class_body;

class_body = "{", [member], {EOL, [member]}, "}";

member = def | simple;

access_class_member = IDENTIFIER, ".", IDENTIFIER, {"(", [args], ")"};

### Array

elements = expr, {",", expr}

array = "[", elements,"]"

access_array_member = IDENTIFIER, "[", expr, "]"

### Program

program = [defclass | def | statement], EOL;

## Intermediate Representation

op |  | sample 
---- | --- | ---
iconst int reg | save int to register |iconst 1 r0
sconst int reg | save string to register|sconst (string address) r0
move src dest | copy value between stack and register |move (stack address) r0
gmove src dest | copy value between heep and register |gmove (heap address) r1
ifzero reg int | if reg is 0 then goto int label |ifzero r0 5
goto int | goto int lable | goto 7
call reg int | call function reg with parameters (int count) |call r5 3
return ret | return function to ret | return r1
save int | save register to stack and update fp and sp | save (stack address)
restore int | restore register from stack and update fp and sp|restore (stack address)
neg reg | - reg |neg r0
add reg1 reg2 | reg1 = reg1 + reg2 | add r0 r1
sub reg1 reg2 | reg1 = reg1 - reg2 | sub r0 r1
mul reg1 reg2 | reg1 = reg1 * reg2 | mul r0 r1
div reg1 reg2 | reg1 = reg1 / reg2 | div r0 r1
rem reg1 reg2 | reg1 = reg1 % reg2 | rem r0 r1
equal reg1 | reg1 = reg1 == reg2 ? 1 : 0 | equal r0 r1
more reg1 reg2 | reg1 = reg1 > reg2 ? 1 : 0 | more r0 r1
less reg1 reg2 | reg1 = reg1 < reg2 ? 1 : 0 | less r0 r1

# Plugin
https://github.com/rubyide/vscode-ruby