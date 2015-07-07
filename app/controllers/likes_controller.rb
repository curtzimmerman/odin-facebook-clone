class LikesController < ApplicationController
	def create
		@like = Like.new(like_params)
		if @like.save
			redirect_to root_path
		else
			flash.now[:danger] = "Unable to like?"
			render root_path
		end
	end

	def destroy
		Like.find(params[:id]).destroy
		redirect_to root_path
	end

	private

	def like_params
		params.require(:likes).permit(:user_id, :post_id)
	end

end