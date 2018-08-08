Rails.application.routes.draw do
    root 'users#index'
    get 'users/total' => 'users#total'
    get 'users' => 'users#allusers'
    post 'users/:id/update' =>  'users#update'
    resources :users
    #===========================================================
    # patch 'users/:id" => "users#update'
    # root GET    /                         users#index
    # users_total GET    /users/total(.:format)    users#total
    #       users GET    /users(.:format)          users#index
    #             POST   /users(.:format)          users#create
    #    new_user GET    /users/new(.:format)      users#new
    #   edit_user GET    /users/:id/edit(.:format) users#edit
    #        user GET    /users/:id(.:format)      users#show
    #             PATCH  /users/:id(.:format)      users#update
    #             DELETE /users/:id(.:format)      users#destroy
    #===========================================================
end
