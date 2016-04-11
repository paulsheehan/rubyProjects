class CustomerHandler
	
	#sorts customers id in accending order
	def sort_customer(customers)
		customers.sort{|a, b| a.instance_variable_get(:@user_id) <=> b.instance_variable_get(:@user_id)}
	end
	
	#checks if the customer is within 100km of the Intercom office
	def isNearIntercomOffice(latUser, longUser)
		#Uses Haversine formula to calculate distance between GPS co-ord
		latIntercom, longIntercom = 53.3381985, -6.2592576
		
		#Converts all GPS coordinates from degrees to radian
		longUser = longUser.to_f / 360*2*3.14
		latUser = latUser.to_f / 360*2*3.14
		longIntercom = longIntercom / 360*2*3.14
		latIntercom = latIntercom / 360*2*3.14
		
		#distance between the 2 locations for latitude and longitude
		dlong = longIntercom - longUser
		dlat = latIntercom - latUser
		
		#formula for a
		a = Math::sin(dlat/2)**2 + Math::cos(latIntercom) * Math::cos(latUser) * Math::sin(dlong/2)**2
		#formula for c
		c = 2 * Math::asin(Math::sqrt(a))
		#radius of planet Earth
		r = 6371
		#final distance
		d = c*r
		near = false
		#is the distance of this customer within 100km of Intercom
		if d < 100
			near = true
		end

		return near
	end
end
