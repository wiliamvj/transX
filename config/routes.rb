Rails.application.routes.draw do
  devise_for :users
  resources :transactions, only: [:index, :new, :create, :destroy]
  root "transactions#index"
end
