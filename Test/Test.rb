require_relative '../Core/Interpreter'
require_relative '../Core/Environment'
require_relative '../Core/Natives'
require_relative '../Core/Code'

if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
#puts file_path
Interpreter.new(Natives.new.env(Environment.new(nil)), Code.new).run(file_path)