Rails.application.routes.draw do

  # Sessions Routes
  root  'sessions#new'
  post  'sessions'             => 'sessions#login'
  delete'/logout' => 'sessions#logout'

  # Users Routes
  get   'users/new'           => 'users#new'
  post  'users/'              => 'users#register'
  get   'users/:id'           => 'users#profile'
  get   'users/:id/edit'      => 'users#edit'
  patch 'users/:id/update'    => 'users#update'

  # Secret Routes
  get   'secrets'             => 'secrets#index'
  post  'secrets'             => 'secrets#post'
  delete'secrets/:id'         => 'secrets#delete'
  post  'secrets/:id/like'    => 'likes#like'       # Likes Rout for <liking a secret>
  post  'secrets/:id/dislike' => 'likes#dislike'    # Likes Rout for <disliking a secret>
  delete'secrets/:id/destroy' => 'secrets#destroy'

end
