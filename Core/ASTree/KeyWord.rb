require_relative 'Name'

class KeyWord < Name
    def test(level, tag)
        debug_log(level, tag, "KeyWord: #{name}")
    end
end