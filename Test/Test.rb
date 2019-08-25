require_relative '../Core/Interpreter'
require_relative '../Core/Environment'
require_relative '../Core/Natives'

if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
#puts file_path
option = {
    debug: true,
    parse: true,
    eval: true,
}
Interpreter.new(Natives.new.env(Environment.new(nil))).run(file_path, option)