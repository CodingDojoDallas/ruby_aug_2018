class PostsController < ApplicationController
  layout "three_column"
  def index
    @all_posts = Post.all
    @all_users = User.all
  end

  def create
    new_post = Post.create(post_params)
    unless new_post.valid?
      flash[:notice] = new_post.errors.full_messages
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
