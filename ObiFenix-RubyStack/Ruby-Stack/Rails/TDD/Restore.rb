class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new]

  def new
  end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        flash[:errors] = "Incorrect login information!"
        redirect_to :back
      end
  end

  # ======================
  # DELETE /user/:id
  # DELETE /user/:id.json
  # ======================
  def logout
    reset_session
    redirect_to new_session_path
  end

  private
  # Sanatizes/Validates Form Parameters...
    def form_params
      params.require(:user_form).permit(:name, :email, :password)
    end
  end
end


==========================
Main ApplicationController
==========================
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end



==========
USER MODEL
==========

class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save { self.email.downcase! unless self.email.blank? }

  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
end

# u = User.new(name: 'oscar', email: 'o@gmail.com', password: '', password_confirmation: 'nomatch')
# u.save                                                           # => false, password required
# u.password = 'password'
# u.save                                                           # => false, confirmation doesn't match
# u.password_confirmation = 'password'
# u.save                                                           # => true
# u.authenticate('not password')                                   # => false
# u.authenticate('password')                                       # => user instance
# ## putting it all together
# User.find_by_email('o@gmail.com').try(:authenticate, 'password') # => user instance
# User.find_by_email('o@gmail.com').try(:authenticate, 'not')      # => false
# User.find_by_email('not@il.com').try(:authenticate, 'password')  # => false



======
Routes
======
Rails.application.routes.draw do
  root   'sessions#new'
  post   'sessions/login'    => 'sessions#login'
  get    'sessions/logout'   => 'sessions#logout'
---------------------------------
  # Users Routes
  root  'users#new'
  get   'users/new'           => 'users#new'
  get   'users/profile'       => 'users#profile'
  post  'users/'              => 'users#register'
  get   'users/:id/edit'      => 'users#edit'
  patch 'users/update'        => 'users#update'

  # Sessions Routes
  get   'sessions/new'        => 'sessions#new'
  post  'sessions/'           => 'sessions#login'
  delete'sessions/:id/logout' => 'sessions#logout'

  # Secret Routes
  get   'secrets'             => 'secrets#index'
  post  'secrets'             => 'secrets#post'
  delete'secrets/:id'         => 'secrets#delete'
  post  'secrets/like'        => 'likes#like'       # Likes Rout for <liking a secret>
  post  'secrets/dislike'     => 'likes#dislike'    # Likes Rout for <disliking a secret>
  get   'secrets/destroy'     => 'secrets#destroy'

end
