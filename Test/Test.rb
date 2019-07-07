require_relative '../Core/Interpreter'

if ARGV.length != 1
    puts "Usage: ruby Test.rb script file name"
    return
end
file_path = File.dirname(__FILE__) + "/" + ARGV[0]
#puts file_path
Interpreter.new.run(file_path)