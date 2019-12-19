Rails.application.routes.draw do
  devise_for :users
  root to: 'albums#index'
  resources :albums do
    resources :posts
  end
  resources :albums do
    resources :favorites, only: [:create, :destroy]
  end
end
