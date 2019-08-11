require_relative '../Objects/SnowObject'

class AccessClassMemberStatement
    def eval(outer_env)
        c = outer_env.get(object.name)
        raise "Cannot find object:#{object.name}" unless c
        if c.is_a? SnowClass
            handle_class(c)
        elsif c.is_a? SnowObject
            handle_object(c, outer_env)
        end
    end
    def handle_class(c)
        case member.name
        when "new" then return create_object(c)
        else
            raise "Invalid member #{member.name}"
        end
    end
    def create_object(c)
        env = Environment.new(c.env)
        o = SnowObject.new(env)
        env.put_new("this", o)
        c.body.eval(env)
        o
    end
    def handle_object(o, env)
        o.read(member.name)
    end
end