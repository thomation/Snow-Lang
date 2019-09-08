require_relative 'Parsers'
require_relative 'Lexer'
require_relative 'Environment'
Dir[File.dirname(__FILE__) + '/Evaluator/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Compiler/*.rb'].each {|file| require file }

class Interpreter
    def initialize(env, code)
        @parser = Parsers.new
        @env = env
        @code = code
    end
    def run (file)
        puts "lexer"
        l = Lexer.new(file)
        l.test
        puts "parser"
        while(l.peek(0)) do
            ast = @parser.parse(l, l.length)
            ast.test(0, "root")
            #puts "value: #{ast.eval(@env)}"
            ast.compile(@code)
            puts "IL:"
            @code.test
        end
        
    end
end