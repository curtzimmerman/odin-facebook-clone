class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"
	has_one :friend_request
	
	validates :user_id, uniqueness: { scope: :friend_id}
	validate :not_already_friends

	def add_inverse_friendship
		Friendship.create(user_id: self.friend_id, friend_id: self.user_id)
	end

	def not_already_friends
	end
end
