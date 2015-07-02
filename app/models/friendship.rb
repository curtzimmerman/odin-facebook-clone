class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"
	belongs_to :friend_request
end
