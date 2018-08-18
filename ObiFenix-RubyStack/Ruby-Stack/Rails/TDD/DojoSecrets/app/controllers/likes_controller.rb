class LikesController < ApplicationController
  def like
    Like.create(user: current_user, secret_id: params[:id])
    redirect_to "/secrets"
  end

  def dislike
    @like = Like.find(params[:id])
    @like.destroy if current_user === @like.user
    redirect_to "/secrets"
  end
end
