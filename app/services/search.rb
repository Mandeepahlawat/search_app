class Search
	attr_accessor :destination_id, :source

	def initialize(source_id, destination_id)
		@destination_id = destination_id
		@source = User.find_by_id source_id
	end

	def find
		visited_user_ids = []
		stack = []
		
		source.friends.each do |friend|
			stack << [friend, "#{source.name} -> #{friend.name}"]
			visited_user_ids << friend.id
		end	
		
		while stack.length != 0
			current_user = stack.pop
			if current_user[0].id == destination_id
				return "#{current_user[1]}"
			end

			if current_user[0].friends
				current_user[0].friends.each do |friend|
					unless visited_user_ids.include? friend.id
						stack << [friend, "#{current_user[1]} -> #{friend.name}"]
						visited_user_ids << friend.id
					end
				end
			end
		end
	end
end