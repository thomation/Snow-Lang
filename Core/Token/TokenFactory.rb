require_relative 'Token'

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
                :pattern => /^(if|else|elseif|while|def|fun|class|extends|local)$/,
            },
            {
                :class => SepToken,
                :pattern => /^({|}|\(|\)|,|\[|\])$/,
            },
            {
                :class => OpToken,
                :pattern => /^(==|>=|<=|=|\+|-|\*|\/|<|>|and|or)$/,
            },
            {
                :class => AccessToken,
                :pattern => /^(\.)$/,
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