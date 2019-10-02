require_relative 'Instruction'
require_relative 'Opcode'

class FuncInstruction < Instruction
    def initialize(func_name)
        @func_name = func_name
        super()
    end
end
class SaveInstruction < FuncInstruction
    attr_writer :args_num

    def initialize(func_name)
        super
        @desc = "#{@func_name} Save: stack offset"
        @id = Opcode::SAVE
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
        @code_seg.add(@args_num)
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = @vm_segs[:code]
        stack = @vm_segs[:stack]
        regs = @vm_segs[:reg]

        pc = @vm_regs[:pc]
        sp = @vm_regs[:sp]

        num = code_seg[pc + 1]
        dest = num + sp
        i = 0
        while i < VMDefine::NUM_OF_REG do
            stack[dest] = regs[i]
            dest += 1
            i += 1
        end

        stack[dest] = @vm_regs[:fp]
        dest += 1
        @vm_regs[:fp] = sp
        @vm_regs[:sp] = sp + num + VMDefine::SAVE_AREA_SIZE

        stack[dest] = @vm_regs[:ret];
        dest += 1
        
        pc + 2
    end
end
class RestoreInstruction < FuncInstruction
    attr_writer :args_num

    def initialize(func_name)
        super
        @desc = "#{@func_name} Restore: stack offset"
        @id = Opcode::RESTORE
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
        @code_seg.add(@args_num)
    end
    def decode(vm_segs, vm_regs)
        super
        code_seg = @vm_segs[:code]
        stack = @vm_segs[:stack]
        regs = @vm_segs[:reg]

        pc = @vm_regs[:pc]
        fp = @vm_regs[:fp]

        num = code_seg[pc + 1]
        dest = fp + num
        i = 0
        while i < VMDefine::NUM_OF_REG do
            regs[i] = stack[dest]
            dest += 1
            i += 1
        end

        @vm_regs[:sp] = fp
        @vm_regs[:fp] = stack[dest]
        dest += 1

        @vm_regs[:ret] = stack[dest]
        dest += 1

        pc + 2
    end
end
class ReturnInstruction < FuncInstruction
    def initialize(func_name)
        super
        @desc = "#{@func_name} Return:"
        @id = Opcode::RETURN
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
    end
    def decode(vm_segs, vm_regs)
        super
        pc = @vm_regs[:ret]
        pc
    end
end
class CallInstruction < FuncInstruction
    attr_writer :args_num
    attr_writer :entry

    def initialize(func_name)
        super
        @desc = "#{@func_name} Call: entry pc, num of args"
        @id = Opcode::CALL
    end
    def encode(code_seg)
        super
        @code_seg.add(self)
        @code_seg.add(@entry)
        @code_seg.add(@args_num)
    end
    def decode(vm_segs, vm_regs)
        super
        pc = @vm_regs[:pc]
        code_seg = @vm_segs[:code]
        @vm_regs[:ret] = pc + 3
        code_seg[pc + 1]
    end
end