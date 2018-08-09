Rails.application.routes.draw do
  root 'rpgs#index'
  post '/process' => 'rpgs#process_money'
  # post '/farm' => 'rpgs#farm'
  # post '/cave' => 'rpgs#cave'
  # post '/house' => 'rpgs#house'
  # post '/casino' => 'rpgs#casino'
  post '/reset' => 'rpgs#reset'
end
