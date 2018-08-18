class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    @likes = Like.all
  end

  def create
    @secret = Secret.new(content: params[:Content], user_id: current_user.id)
    if @secret.save
      redirect_to :back
    else
      flash[:errors] = "You must tell your secret"
      redirect_to :back
    end
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy if @secret.user == current_user
    @user = current_user
    redirect_to "/users/#{@user.id}"
  end
end
