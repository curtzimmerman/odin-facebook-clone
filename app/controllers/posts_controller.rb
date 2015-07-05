class PostsController < ApplicationController
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Posted"
			redirect_to root_path
		else
			flash.now[:danger] = "Failed to post"
			render 'static_pages/home'
		end
	end

	def destroy
	end

	def index
		@posts = Post.all
	end

	private

	def post_params
		params.require(:post).permit(:body)		
	end


end