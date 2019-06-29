require_relative 'ASTLeaf'

class Name < ASTLeaf
    def name
        return token.text
    end
    def test
        puts "Name: #{name}"
    end
end