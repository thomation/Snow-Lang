require_relative '../Core/Main'

file_path = File.dirname(__FILE__) + "/" + 'compile.sn'
#Main.run_with_compile(file_path)
Main.run_with_eval(file_path)