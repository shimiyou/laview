Rails.application.routes.draw do
  devise_for :users
  root to: 'albums#index'
  resources :albums do
    resources :posts
  end
end
