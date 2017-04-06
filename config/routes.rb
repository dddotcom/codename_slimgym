Rails.application.routes.draw do

  root 'main#index'

  # get 'sessions/new'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get 'signup' => "user#new"
  post 'signup' => "user#create"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
