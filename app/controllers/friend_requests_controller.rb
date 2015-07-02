class FriendRequestsController < ApplicationController
	def create
		@friend_request = FriendRequest.new(friend_request_params)
		if @friend_request.save
			flash[:success] = "Friend Request sent"
			redirect_to User.find_by(id: @friend_request.recipient_id)
		else
			flash.now[:danger] = "Could not send friend request"
			redirect_to current_user
		end
	end

	private

	def friend_request_params
		params.require(:friend_request).permit(:sender_id, :recipient_id)
	end
end
