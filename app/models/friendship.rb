class Friendship < ApplicationRecord
	belongs_to :user, counter_cache: :friends_count
	belongs_to :friend, class_name: "User"

	after_create :create_inverse, unless: :has_inverse?
	after_destroy :delete_inverse

	private

		def create_inverse
	    Friendship.create(inverse_data)
	  end

	  def has_inverse?
	    Friendship.exists?(inverse_data)
	  end

	  def inverse_data
	    {friend_id: user_id, user_id: friend_id}
	  end

	  def delete_inverse
	  	friendship = Friendship.where(friend_id: user_id, user_id: friend_id).first
  		friendship.destroy if friendship
	  end
end
