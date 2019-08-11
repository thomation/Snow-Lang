require_relative 'Token'
require_relative 'IdToken'
require_relative 'NumToken'
require_relative 'StrToken'
require_relative 'ErrToken'
require_relative 'KeyToken'
require_relative 'OpToken'
require_relative 'SepToken'

class TokenFactory
    def self.create(line_no, value)
        tokens = [
            {
                :class => StrToken,
                :pattern => /^\".*\"$/,
            },
            {
                :class => NumToken,
                :pattern => /^[0-9]*\.?[0-9]+$/,
            },
            {
                :class => KeyToken,
                :pattern => /^(if|else|elseif|while|def|fun|class|extends)$/,
            },
            {
                :class => SepToken,
                :pattern => /^({|}|\(|\))|(,)$/,
            },
            {
                :class => OpToken,
                :pattern => /^(==|>=|<=|=|\+|-|\*|\/|<|>|and|or)$/,
            }
        ]
        tokens.each do |token|
            if value =~ token[:pattern]
                return token[:class].new(line_no, value)
            end
        end
        return IdToken.new(line_no, value)
    end
end