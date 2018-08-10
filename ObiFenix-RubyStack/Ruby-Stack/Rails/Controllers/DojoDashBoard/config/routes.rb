Rails.application.routes.draw do
  root 'dojo#index'
  get  'dojos' => 'dojo#index'
  post 'dojos' => 'dojo#create'
  get  'dojos/new' => 'dojo#new'
  get  'dojos/:id' => 'dojo#show'
  get  'dojos/:id/edit' => 'dojo#edit'
  post 'dojos/:id' => 'dojo#destroy'
  patch 'dojos/:id/update' => 'dojo#update'
end
