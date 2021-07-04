Rails.application.routes.draw do
  root 'sessons#home'
  get '/signup' 'users#new'
  get '/login' 'sessions#new'
  post '/login' 'sessions#new'
  resources :stores
  resources :coupons
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
