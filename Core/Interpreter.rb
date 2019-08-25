require_relative 'Parsers'
require_relative 'Lexer'
require_relative 'Environment'
Dir[File.dirname(__FILE__) + '/Evaluator/*.rb'].each {|file| require file }

class Interpreter
    def initialize(env)
        @parser = Parsers.new
        @env = env
    end
    def run (file, option)
        puts "lexer" if option[:debug]
        l = Lexer.new(file)
        l.test if option[:debug]
        
        if option[:parse]
            puts "parser" if option[:debug]
            while(l.peek(0)) do
                ast = @parser.parse(l, l.length)
                ast.test(0, "root") if option[:debug]
                puts "value: #{ast.eval(@env)}" if option[:eval]
            end
        end
    end
end