require_relative 'arraySum'

originalArray = Array.[](1,2,3,4, Array.[](5, 6, 7), 8, 12, 14)
flattenedArray = Array.new

start = ArrayController.new
puts start.flattenIntArray(self, flattenedArray, originalArray)

