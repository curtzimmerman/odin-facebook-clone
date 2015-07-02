module FriendRequestsHelper
	def friend_request_already_sent?(sender_id, recipient_id)
		FriendRequest.find_by(sender_id: sender_id, recipient_id: recipient_id)	
	end
end
