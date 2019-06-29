require '../Core/Lexer'
require '../Core/Parser'

l = Lexer.new("./exp.sn")
l.test
p = Parser.new
while l.peek(0) != nil do
    ast = p.parse(l)
    ast.test
end