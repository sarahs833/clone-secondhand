Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  get 'pages/:id' => 'pages#showproduct', as: 'show_product'

  get '/products/new' => 'products#new', as: 'new_product'
  post '/products' => 'products#create'
  get '/products/user' => 'products#user', as: 'user_product'
  get '/products/:id/edit' => 'products#edit', as: 'product'
  patch '/products/:id/edit' => 'products#update'
  delete '/products/:id' => 'products#destroy', as: 'destroy_product'

  resources :products do
    resources :bookings
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
