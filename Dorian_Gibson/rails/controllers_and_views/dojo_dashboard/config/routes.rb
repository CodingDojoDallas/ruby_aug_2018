Rails.application.routes.draw do
  get 'students/index'

  root 'dojos#root'
  resources :dojos do
    resources :students
  end

end