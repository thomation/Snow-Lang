require_relative 'Interpreter'
require_relative 'Environment'
require_relative 'Natives'
require_relative 'SnowVM'
require_relative 'Parsers'
require_relative 'Lexer'

class Main
	def self.run(file_path)
		env = Natives.new.env(Environment.new(nil))
		lexer = Lexer.new
		parser = Parsers.new
		vm = SnowVM.new(nil)
		Interpreter.new(env, lexer, parser, vm).run(file_path)
		puts "Run VM"
		vm.run(0)
		vm.test
	end
end
if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
Main.run(file_path)
