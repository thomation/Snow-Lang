class Token
    def initialize(line_no, value)
        @line_no = line_no
        @value = value
    end
    def number
        return @value.to_i
    end
    def text
        return @value.to_s
    end
    def test
        puts "#{@line_no}\t#{self.class}\t$#{@value}$" 
    end
end