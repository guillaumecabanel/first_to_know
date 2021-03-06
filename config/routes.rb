Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :searches, only: [:index, :new, :create, :show, :destroy]
end
