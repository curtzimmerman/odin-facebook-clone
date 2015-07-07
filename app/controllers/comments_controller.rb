class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Comment posted"
			redirect_to root_path
		else
			flash.now[:danger] = "Unable to post comment"
			render root_path
		end
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :body)
	end

end