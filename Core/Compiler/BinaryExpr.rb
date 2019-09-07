class BinaryExpr
    def compile(code)
    	if operator.value == "="
            
        else
        	left.compile(code)
        	right.compile(code)
        end
    end
end