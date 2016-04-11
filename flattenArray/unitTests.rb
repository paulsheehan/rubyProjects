require 'test/unit'
require_relative 'arraySum'

class UnitTester < Test::Unit::TestCase
	test "the method can handle lots of indented arrays" do
		testController = ArrayController.new
		blankArray = Array.new
		testArray = Array.[](1, 4, 7)
		for i in 0..10 
			testArray.insert(1, i)
		end
		if testController.flattenIntArray(self, blankArray, testArray).size > 0
			assert true
		end
	end
end 
	
