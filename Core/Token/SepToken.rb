require_relative 'Token'

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