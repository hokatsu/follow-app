Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create]

  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member 
  end
end
# , only: :show