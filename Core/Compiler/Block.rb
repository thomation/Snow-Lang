require_relative '../Opcode'
class Block
    include Opcode
    def compile(code)
        if childrenAmount > 0
            init_reg = code.next_reg
            index = 0
            while index < childrenAmount do
                code.next_reg = init_reg
                child(index).compile(code)
                index += 1
            end
        else
            ICONST.set_value(0)
            ICONST.encode(code)
        end
    end
end