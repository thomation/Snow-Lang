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
    def line_no
        return @line_no
    end
    def test
        puts debug_s
    end
    def debug_s
        return "#{@line_no}\t#{self.class}\t$#{@value}$"
    end
end
class ErrToken < Token 
end
class IdToken < Token
end
class KeyToken < Token
end
class NumToken < Token
    def number
        if @value =~ /\./
            return @value.to_f
        end
        return @value.to_i
    end
end
class OpToken < Token
end
class SepToken < Token
    def self.left
        "("
    end
    def self.right
        ")"
    end
    def self.open
        "{"
    end
    def self.close
        "}"
    end
    def self.mid
        ","
    end
end
class StrToken < Token
end
class AccessToken < Token
end