Rails.application.routes.draw do
  resources :coupons
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => "sessions#destroy"
  #post '/login' 'sessions#new'
  resources :stores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
