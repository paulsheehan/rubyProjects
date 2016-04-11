class Customer
	attr_accessor :location_lat, :id, :name, :location_long

	def initialize(lat, id, name, long)
		@location_lat = lat
		@user_id = id
		@name = name
		@location_long = long
	end

	#Prints name and id of the customer
	def formatted_customer
		"#{@name} <#{@user_id}>"
	end
end
