Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/pages/contact', to: 'pages#contact'

  resources :cars, only: [:index, :new, :create, :destroy]
  resources :reservations, only: [:index, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
