class LikesController < ApplicationController
  before_action :require_login
  def create
    new_like = Like.create(user_id: current_user.id, secret_id: params[:id])
    redirect_to "/secrets"
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, secret_id: params[:id])
    unless like == nil
      like.destroy
      redirect_to "/secrets"
    else
      redirect_to "/secrets"
    end
  end
end
