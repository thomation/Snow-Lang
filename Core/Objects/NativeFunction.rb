class NativeFunction
    def initialize(proc)
        @proc = proc
    end
    def invoke(args)
        @proc.call(args)
        0
    end
end