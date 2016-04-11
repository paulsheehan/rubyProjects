require 'open-uri'
require 'json'
require_relative 'Customer'

class FileHandler
	def initialize()
	end

	def readJsonFile
		@url = "https://gist.githubusercontent.com/brianw/19896c50afa89ad4dec3/raw/6c11047887a03483c50017c1d451667fd62a53ca/gistfile1.txt"
		buffer = String.new
		#buffer string contains entire JSON file
		buffer = open(@url).read
		#empty array
		customerArray = Array.new
		#passes JSON string and empty array into next function
		parseFile(buffer, customerArray)
	#after all functions return array will be filled with customer object
		return customerArray
	end
	
	def parseFile(buffer, customerArray)
		#JSON string is broken into lines
		parsedLine = buffer.split("\n")
		parsedLine.each do |i|
			#calls this function for each line passes empty array
			insertIntoCustomerObject(i, customerArray)
		end
		#returns full array of Customer objects
		return customerArray
	end

	def insertIntoCustomerObject(j, customerArray)
		#parses into the 4 customer fields
		fieldHash = JSON.parse(j)
		#contatinates customer information into the array and inserts into new  Customer object
		customerArray << Customer.new(fieldHash["latitude"], fieldHash["user_id"], fieldHash["name"], fieldHash["longitude"])
	end
end
