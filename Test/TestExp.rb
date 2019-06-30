require '../Core/Lexer'
require '../Core/Parsers'

puts "lexer"
l = Lexer.new("./exp.sn")
l.test
puts "parser"
p = Parsers.new
while(l.peek(0)) do
    ast = p.parse(l)
    ast.test(0, "root")
end