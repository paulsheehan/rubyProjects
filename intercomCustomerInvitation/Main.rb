require_relative 'FileHandler'
require_relative 'Customer'
require_relative 'CustomerHandler'

#this class will read the json file and parse it into the customer class
fileHandler = FileHandler.new
#declare empty array
customer = Array.new
#fill array with Customer objects by starting chain of fileHandler functions
customer = fileHandler.readJsonFile
#this class will handle sort Customer objects by id and calculate the distance
customerHandler = CustomerHandler.new
#passes array into sort function
customer = customerHandler.sort_customer(customer)
#traverses array calling distance function; returns true if 100km from office
for i in 0..customer.size-1
	if customerHandler.isNearIntercomOffice(customer.at(i).instance_variable_get(:@location_lat), customer.at(i).instance_variable_get(:@location_long)) == true
		#prints the customers within 100km of the office
		puts customer.at(i).formatted_customer
	end
end
