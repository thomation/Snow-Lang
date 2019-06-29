require '../Core/Lexer'
require '../Core/Parsers'

puts "lexer"
l = Lexer.new("./exp.sn")
l.test
puts "parser"
p = Parsers.new
ast = p.parse(l)
ast.test