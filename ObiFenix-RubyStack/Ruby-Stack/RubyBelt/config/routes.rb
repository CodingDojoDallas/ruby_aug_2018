Rails.application.routes.draw do
  root 'main#index'
  get 'main/sw' => 'main#switch'
  post 'main/register' => 'main#register'
  post 'main/login' => 'main#login'
  delete 'logout' => 'main#logout'
  # delete ''

  resources :main
  resources :users
  resources :songs

#   Prefix            Verb   URI Pattern               Controller#Action
# ====================================================================== [ Main Routs ]
#     root            GET    /                         main#index              |
#  main_sw            GET    /main/sw(.:format)        main#switch         <----
# main_register       POST   /main/register(.:format)  main#register
# main_login          POST   /main/login(.:format)     main#login
#   logout            DELETE /logout(.:format)         main#logout
# main_index          GET    /main(.:format)           main#index
#                     POST   /main(.:format)           main#create
# new_main            GET    /main/new(.:format)       main#new
# edit_main           GET    /main/:id/edit(.:format)  main#edit
#     main            GET    /main/:id(.:format)       main#show
#                     PATCH  /main/:id(.:format)       main#update
#                     PUT    /main/:id(.:format)       main#update
#                     DELETE /main/:id(.:format)       main#destroy
# ====================================================================== [ Users Routes ]
#    users            GET    /users(.:format)          users#index              |
#                     POST   /users(.:format)          users#create         <----
# new_user            GET    /users/new(.:format)      users#new
# edit_user           GET    /users/:id/edit(.:format) users#edit
#     user            GET    /users/:id(.:format)      users#show
#                     PATCH  /users/:id(.:format)      users#update
#                     PUT    /users/:id(.:format)      users#update
#                     DELETE /users/:id(.:format)      users#destroy
# ====================================================================== [ Songs Routs ]
#    songs            GET    /songs(.:format)          songs#index              |
#                     POST   /songs(.:format)          songs#create         <----
# new_song            GET    /songs/new(.:format)      songs#new
# edit_song           GET    /songs/:id/edit(.:format) songs#edit
#     song            GET    /songs/:id(.:format)      songs#show
#                     PATCH  /songs/:id(.:format)      songs#update
#                     PUT    /songs/:id(.:format)      songs#update
#                     DELETE /songs/:id(.:format)      songs#destroy

end
