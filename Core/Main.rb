require_relative 'Interpreter'
require_relative 'Environment'
require_relative 'Natives'
require_relative 'Code'

class Main
	def self.run(file_path)
		Interpreter.new(Natives.new.env(Environment.new(nil)), Code.new).run(file_path)
	end
end
if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
Main.run(file_path)
