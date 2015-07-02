class FriendshipsController < ApplicationController

	def create
		@friendship = Friendship.new(friendship_params)
		if @friendship.save
			@friendship.create_friend_request
			flash:success] = "Friend request sent"
			redirect_to User.find_by(id: @friendship.friend_id )
		else
			flash.now[:danger] = "Unable to send request"
			render 'show'
		end
	end

	def destroy

	end

	private

	def friendship_params
		params.require(:friendship).permit(:user_id, :friend_id)
	end
end
