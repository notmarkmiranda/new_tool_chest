Rails.application.routes.draw do
  root to: "users#static"

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
