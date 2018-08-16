class SecretsController < ApplicationController
  before_action :require_login
  def index
    @all_secrets = Secret.all
    @likes = Like.all
  end

  def create
    new_secret = Secret.create(secret_params.merge({ user_id: current_user.id }))
    if new_secret.valid?
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = new_secret.errors.full_messages
      redirect_to "/users/#{current_user.id}"
    end
  end

  def destroy
    secret = Secret.find(params[:id])
    if session[:user_id] == secret.user_id
      secret.destroy
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/users/#{session[:user_id]}"
    end
    
  end

  private
    def secret_params
      params.require(:secret).permit(:content)
    end
end