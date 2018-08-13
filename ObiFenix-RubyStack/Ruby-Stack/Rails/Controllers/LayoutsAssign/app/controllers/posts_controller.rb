
class PostsController < ApplicationController

	layout "three_column"

	def index
    # This view is automatically rendered by <Rails>
		@all_posts = Post.all
		@all_users = User.all
	end

	def new
		Post.new
	end

	def create
		puts "=================================== [ Post starts ]"
		@post = Post.create(post_params)
		puts "=================================== [ Post ends ]"
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :user_id)
    end

end