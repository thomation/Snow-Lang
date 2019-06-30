class ASTNode
    def child(index)
    end
    def test(level, tag)
        debug_log(level, tag, "ASTNode")
    end
    def debug_log(level, tag, content)
        puts "---|" * level + "#{tag} : #{content}"
    end
end