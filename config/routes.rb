Rails.application.routes.draw do


  

  

resources :users, :attractions, :rides
root 'users#index'
get '/signin' => 'sessions#new'
post '/logout' => 'sessions#delete'
post '/signin' => 'sessions#create'

get '/attractions/new' => 'attractions#new'
post '/attractions/new' => 'attractions#create'

post '/rides/new' => 'rides#new'
post '/attractions/delete' => 'attractions#destroy'
post '/rides/create' => 'rides#create'
end