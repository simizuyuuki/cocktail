Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resource :likes, only: [:create, :destroy]
      resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end