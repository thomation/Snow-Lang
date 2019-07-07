require_relative 'Token'

class SepToken < Token
    def self.left
        return "("
    end
    def self.right
        return ")"
    end
    def self.open
        return "{"
    end
    def self.close
        return "}"
    end
end