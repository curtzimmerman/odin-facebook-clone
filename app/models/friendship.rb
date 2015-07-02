class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"
	has_one :friend_request
end
