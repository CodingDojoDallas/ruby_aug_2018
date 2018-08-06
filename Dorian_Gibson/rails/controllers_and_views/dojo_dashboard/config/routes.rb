Rails.application.routes.draw do
  root 'dojos#root'
  resources :dojos

end