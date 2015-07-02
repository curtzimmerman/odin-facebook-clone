module FriendRequestsHelper
	def friend_request_already_sent?(user1, user2)
		FriendRequest.find_by(sender_id: user1, recipient_id: user2) || FriendRequest.find_by(sender_id: user2, recipient_id: user1)	
	end
end
