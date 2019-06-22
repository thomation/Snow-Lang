class Lexer
    def initialize(file)
        lines = File.readlines(file)
        lines.each_index { |index|
            find_tokens(index + 1, lines[index])
        }
    end
    def find_tokens(line_no, line)
        puts "#{line_no} : #{line}"
        words = line.split()
        words.each{ |word|
            puts "$#{word}$"
        }
    end
    def test
    end
end