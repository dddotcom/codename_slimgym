Rails.application.routes.draw do

  root 'main#index'

  # get 'sessions/new'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get 'signup' => "user#new"
  get 'checkins/new' => "checkin#new"
  post 'checkins/new' => "checkin#create"
  post 'signup' => "user#create"
  get 'users/show' => "user#show"
  get 'users/edit' => "user#edit"
  post 'users/edit' => "user#update"

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
