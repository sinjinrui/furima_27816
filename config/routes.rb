Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    post 'order', on: :member
    resources :orders, only: [:index] do
      resources :address, only: [:new, :create]
    end
  end
end
