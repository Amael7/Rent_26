Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/pages/contact', to: 'pages#contact'

  resources :reservations, only: [:index]

  # faudra voir si besoin de changer les routes pour mettre le formulaire dans la page home

  resources :cars, only: [:index, :new, :create, :destroy] do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
