class FriendRequest < ActiveRecord::Base
	belongs_to :friendship
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name: "User"

	def accept
		self.update_attribute(:accepted, true)
	end
end
