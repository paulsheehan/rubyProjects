class ArrayController 
	def flattenIntArray(ref, a, a1)
		for i in 0..a1.size
			if a1.at(i).is_a? Integer
				a << a1.at(i)
			end
			if a1.at(i).is_a? Array
				flattenIntArray(self, a, a1[i])
			end
		end
		return a	
	end
end

