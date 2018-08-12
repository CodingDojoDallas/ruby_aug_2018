Rails.application.routes.draw do

  # get 'students/new'

  # get 'students/create'

  # get 'students/show'

  # get 'students/edit'

  # get 'students/update'

  # get 'students/destroy'

  root 'dojo#index'

  resources :dojo do
    resources :students
  end

end


# Prefix            Verb      URI Pattern                                Controller#Action
# ========================================================================================
# root              GET       /                                          dojo#index
# dojo_students     GET       /dojo/:dojo_id/students(.:format)          students#index
#                   POST      /dojo/:dojo_id/students(.:format)          students#create
# new_dojo_student  GET       /dojo/:dojo_id/students/new(.:format)      students#new
# edit_dojo_student GET       /dojo/:dojo_id/students/:id/edit(.:format) students#edit
# dojo_student      GET       /dojo/:dojo_id/students/:id(.:format)      students#show
#                   PATCH     /dojo/:dojo_id/students/:id(.:format)      students#update
#                   PUT       /dojo/:dojo_id/students/:id(.:format)      students#update
#                   DELETE    /dojo/:dojo_id/students/:id(.:format)      students#destroy
# dojo_index        GET       /dojo(.:format)                            dojo#index
#                   POST      /dojo(.:format)                            dojo#create
# new_dojo          GET       /dojo/new(.:format)                        dojo#new
# edit_dojo         GET       /dojo/:id/edit(.:format)                   dojo#edit
# dojo              GET       /dojo/:id(.:format)                        dojo#show
#                   PATCH     /dojo/:id(.:format)                        dojo#update
#                   PUT       /dojo/:id(.:format)                        dojo#update
#                   DELETE    /dojo/:id(.:format)                        dojo#destroy
# ========================================================================================
