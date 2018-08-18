Rails.application.routes.draw do
  root 'sessions#index'
  get 'sessions/sw' => 'sessions#switch'
  delete 'logout' => 'sessions#logout'

  resources :sessions
  resources :users
  resources :events
  resources :comments
end


# Prefix            Verb   URI Pattern                  Controller#Action
# ==================================================================== [ Sessions Routes ]
#   root            GET    /                            sessions#index
# sessions_switch   GET    /sessions/switch(.:format)   sessions#switch
# sessions          GET    /sessions(.:format)          sessions#index
#                   POST   /sessions(.:format)          sessions#create
# new_session       GET    /sessions/new(.:format)      sessions#new
# edit_session      GET    /sessions/:id/edit(.:format) sessions#edit
# session           GET    /sessions/:id(.:format)      sessions#show
#                   PATCH  /sessions/:id(.:format)      sessions#update
#                   PUT    /sessions/:id(.:format)      sessions#update
#                   DELETE /sessions/:id(.:format)      sessions#destroy
# ==================================================================== [ Users Routes ]
#  users            GET    /users(.:format)             users#index
#                   POST   /users(.:format)             users#create
# new_user          GET    /users/new(.:format)         users#new
# edit_user         GET    /users/:id/edit(.:format)    users#edit
#   user            GET    /users/:id(.:format)         users#show
#                   PATCH  /users/:id(.:format)         users#update
#                   PUT    /users/:id(.:format)         users#update
#                   DELETE /users/:id(.:format)         users#destroy
# ==================================================================== [ Events Routes ]
# events            GET    /events(.:format)            events#index
#                   POST   /events(.:format)            events#create
# new_event         GET    /events/new(.:format)        events#new
# edit_event        GET    /events/:id/edit(.:format)   events#edit
#  event            GET    /events/:id(.:format)        events#show
#                   PATCH  /events/:id(.:format)        events#update
#                   PUT    /events/:id(.:format)        events#update
#                   DELETE /events/:id(.:format)        events#destroy
# ==================================================================== [ Comments Routes ]
# comments          GET    /comments(.:format)          comments#index
#                   POST   /comments(.:format)          comments#create
# new_comment       GET    /comments/new(.:format)      comments#new
# edit_comment      GET    /comments/:id/edit(.:format) comments#edit
#  comment          GET    /comments/:id(.:format)      comments#show
#                   PATCH  /comments/:id(.:format)      comments#update
#                   PUT    /comments/:id(.:format)      comments#update
#                   DELETE /comments/:id(.:format)      comments#destroy
