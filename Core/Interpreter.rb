require_relative 'Code'

Dir[File.dirname(__FILE__) + '/Parser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Evaluator/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Compiler/*.rb'].each {|file| require file }

class Interpreter
    def initialize(env, lexer, parser, vm)
        @lexer = lexer
        @parser = parser
        @env = env
        @code = Code.new(vm)
    end
    def run(file_path)
        puts "Token >>>>>>>>>>>>>>>>>>>>>>>>>>"
        @lexer.analyze(file_path)
        @lexer.test
        puts "Token <<<<<<<<<<<<<<<<<<<<<<<"
        while(@lexer.peek(0)) do
            puts "ASTree >>>>>>>>>>>>>>>>>>>>>>>>>>"
            ast = @parser.parse(@lexer, @lexer.length)
            ast.test(0, "root")
            puts "ASTree <<<<<<<<<<<<<<<<<<<<<<<<<<"
            #puts "Eval"
            #puts "value: #{ast.eval(@env)}"
            ast.compile(@code)
            @code.test
        end
        
    end
end