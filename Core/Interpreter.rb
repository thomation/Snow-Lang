require_relative 'Parsers'
require_relative 'Lexer'
require_relative 'Environment'

class Interpreter
    def initialize
        @parser = Parsers.new
        @env = Environment.new
    end
    def run (file)
        puts "lexer"
        l = Lexer.new(file)
        l.test
        puts "parser"
        while(l.peek(0)) do
            ast = @parser.parse(l)
            ast.test(0, "root")
        end
    end
end