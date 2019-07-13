# Snow-Lang

## Token

KEY:     /^(if|else|elseif|while)$/

BLOCK:   /^({|})$/

NUMBER : /^[0-9]*\.?[0-9]+$/

OP:      /^(==|>=|<=|=|\+|-|\*|\/|>|<|not|and|or)$/

STRING: /^\".*\"$/

## BNF

### Expression

primary -> "(" expr ")" | NUMBER | IDENTIFIER | STRING | call

factor -> "-" primary | primary

expr -> factor {OP factor}

### Statement

simple -> expr

branch -> "if" expr block {"elseif" block} ["else" block]

loop -> "while" expr block

statement -> simple | branch | loop

block ->  "{" [statement] { EOL [statement] } "}"

### Function

params -> IDENTIFIER {"," IDENTIFIER}

def -> "def" IDENTIFIER "("[params]")" block

args ->  expr {"," expr}

call -> IDENTIFIER "("[args]")"

### Program

program -> [def | statement] EOL

# Plugin
https://github.com/rubyide/vscode-ruby