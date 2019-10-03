require_relative 'Interpreter'
require_relative 'Environment'
require_relative 'Natives'
require_relative 'SnowVM'
require_relative 'HeapMemory'
require_relative 'Parsers'
require_relative 'Lexer'

class Main
    def self.run_with_eval(file_path)
        env = Natives.new.env(EmbededEnvironment.new(nil))
        lexer = Lexer.new
        parser = Parsers.new
        interpreter = Interpreter.new(env, lexer, parser)
        interpreter.run_with_eval(file_path)
    end
    def self.run_with_compile(file_path)
        env = Natives.new.env(VMEnvironment.new(nil))
        lexer = Lexer.new
        parser = Parsers.new
        interpreter = Interpreter.new(env, lexer, parser)
        interpreter.run_with_compile(file_path)
        code = interpreter.code
        raise "There's no main function for entry" if env.root < 0
        puts "Run VM"
        vm = SnowVM.new(code, HeapMemory.new(10000))
        vm.run(env.root)
        vm.test
    end
end
if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
Main.run(file_path)
