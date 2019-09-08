require_relative 'Interpreter'
require_relative 'Environment'
require_relative 'Natives'
require_relative 'Code'
require_relative 'SnowVM'

class Main
	def self.run(file_path)
		vm = SnowVM.new(nil)
		Interpreter.new(Natives.new.env(Environment.new(nil)), Code.new(vm)).run(file_path)
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
