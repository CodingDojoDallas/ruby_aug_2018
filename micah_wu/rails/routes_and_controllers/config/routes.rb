Rails.application.routes.draw do
resources :users
# get "users" => "users#index"
# get "users/new" => "users#new"
# post "users" => "users#create"
# get "users/:id" => "users#show"
# get "users/:id/edit" => "users#edit"
# patch "users/:id" => "users#update"
# delete "users/:id" => "users#destroy"

get "/" => "users#say"
get "/hello" => "users#hello"
get "/say/hello" => "users#sayhello"
get "/say/hello/joe" => "users#joe"
get "/say/hello/michael" => "users#michael"
get "/times" => "users#times"
get "/times/restart" => "users#reset"
end
