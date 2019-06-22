class Token
    def initialize(line_no, value)
        @line_no = line_no
        @value = value
    end
    def test
        puts "#{@line_no}\t#{self.class}\t$#{@value}$" 
    end
end