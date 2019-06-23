require_relative 'Token'
require_relative 'IdToken'
require_relative 'NumToken'
require_relative 'StrToken'
require_relative 'ErrToken'
require_relative 'KeyToken'
require_relative 'OpToken'
require_relative 'BlockToken'

class TokenFactory
    def self.create(line_no, value)
        if value =~ /^\".*\"$/
            return StrToken.new(line_no, value)
        elsif value =~ /^[0-9]*\.?[0-9]+$/
            return NumToken.new(line_no, value)
        elsif value =~ /^(if|else|elseif|while)$/
            return KeyToken.new(line_no, value)
        elsif value =~ /^(begin|end)$/
            return BlockToken.new(line_no, value)
        elsif value =~ /^(==|=|\+|-|\*|\/|>|<|and|or)$/
            return OpToken.new(line_no, value)
        else
            return IdToken.new(line_no, value)
        end
    end
end