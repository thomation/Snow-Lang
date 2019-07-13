require_relative './Token/TokenFactory'

class Lexer
    def initialize(file)
        @tokens = Array.new;
        lines = File.readlines(file)
        lines.each_index { |index|
            find_tokens(index + 1, lines[index])
        }
        @current_index = 0
    end
    def find_tokens(line_no, line)
        #puts "#{line_no} : #{line}"

        line = remove_endline(line)
        words = line.split(/(==)|(>=)|(<=)|(=)|(\+)|(-)|(\*)|(\/)|(\()|(\))|(>)|(<)|({)|(})|(,)|[ ]+/)
        words.each{ |word|
            word = word.strip
            #puts "$#{word}$"
            @tokens << TokenFactory.create(line_no, word) unless word.empty?
        }
    end
    def remove_endline(line)
        captures = /^(.*)$/.match(line).captures
        return captures[0]
    end
    def peek(index)
        if index + @current_index< @tokens.length
            return @tokens[index + @current_index]
        end
        return nil
    end
    def first!
        token = peek(0)
        @current_index += 1
        return token
    end
    def length
        return @tokens.length
    end
    def test
        @tokens.each{ |token|
            token.test
        }
    end
end