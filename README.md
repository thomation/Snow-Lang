# Snow-Lang

## Token

KEY:     /^(if|else|elseif|while)$/

BLOCK:   /^({|})$/

NUMBER : /^[0-9]*\.?[0-9]+$/

OP:      /^(==|>=|<=|=|\+|-|\*|\/|>|<|not|and|or)$/

STRING: /^\".*\"$/

## BNF

primary -> "(" expr ")" | NUMBER | IDENTIFIER | STRING

factor -> "-" primary | primary

expr -> factor {OP factor}

block ->  "{" [statement] { EOL [statement] } "}" 

simple -> expr

branch -> "if" expr block {"elseif" block} ["else" block]

loop -> "while" expr block

statement -> simple | branch | loop

program -> [statemen] EOL

# Plugin
https://github.com/rubyide/vscode-ruby