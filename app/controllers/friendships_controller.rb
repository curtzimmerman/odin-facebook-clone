class FriendshipsController < ApplicationController

	def create
		friend_request = FriendRequest.find(params[:friendship][:friend_request_id])
		@friendship = friend_request.create_friendship(user_id: friend_request.sender_id, friend_id: friend_request.recipient_id)
		if @friendship.save
			friend_request.accept
			flash[:success] = "Added Friend"
			redirect_to @friendship.friend
		else
			flash.now[:danger] = "Unable to add friend"
			render friend_request.recipient
		end
	end

	def destroy

	end

	private

	def friendship_params
		params.require(:friendship).permit(:friend_request_id)
	end

end
