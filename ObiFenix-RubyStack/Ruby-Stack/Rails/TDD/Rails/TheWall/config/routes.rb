Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new]
  resources :messages, only: [:index, :create]
  resources :comments, only: [:create]
  post "signin" => "users#signin"
  delete "logout" => "users#logout"
end

# vagrant 😎 @ TheWall
# ===========================================================
#  Prefix     Verb    URI Pattern           Controller#Action
# ===========================================================
# root GET    /                             users#new
# new_user    GET     /users/new(.:format)  users#new
# messages    GET     /messages(.:format)   messages#index
#             POST    /messages(.:format)   messages#create
# comments    POST    /comments(.:format)   comments#create
#   signin    POST    /signin(.:format)     users#signin
#   logout    DELETE  /logout(.:format)     users#logout
# ===========================================================

