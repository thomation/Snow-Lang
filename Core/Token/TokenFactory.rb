require_relative 'Token'
class TokenFactory
    def self.create(line_no, value)
        return Token.new(line_no, value)
    end
end