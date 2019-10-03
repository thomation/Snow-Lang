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

declare = "local", IDENTIFIER;

define = declare, "=", expr;

simple = expr;

branch = "if", expr, block, {"elseif", block}, ["else", block];

loop = "while", expr, block;

statement = declare | define | simple | branch | loop;

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
load offset reg | copy value from stack to register |load (stack address) r0
store reg offset | copy value from register to stack |store r0 (stack address)
push reg | push value from register to stack | push r0
pop reg | pop value from statck to regitst | pop r0
gload src reg | copy value from heep to register |gload (heap address) r1
gstore reg dest | copy value from register to heap |gstore r1 (heap address)
ifzero reg int | if reg is 0 then goto int label |ifzero r0 5
goto int | goto int lable | goto 7
call int int | call function (pc = int) with parameters (int count) |call r5 3
return | return function to address save in ret register | return
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
## VSCode
https://github.com/rubyide/vscode-ruby

## Sublime
https://packagecontrol.io/packages/Terminus
