Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => "sessions#destroy"
  
  resources :users, only: [:new, :create, :show]
  resources :coupons only: [:index, :new, :create]
  resources :stores do
    resources :coupons, shallow: true
  end 
end
