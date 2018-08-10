Rails.application.routes.draw do
  root 'dojo#index'
  get  'dojos' => 'dojo#index'
  get  'dojos/new' => 'dojo#new'
  post 'dojos' => 'dojo#create'
  # get  'dojos/show'
  # get  'dojos/edit'
  # post 'dojos/update'
  # post 'dojos/destroy'
end
