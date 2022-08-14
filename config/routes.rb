Rails.application.routes.draw do
  resources :transactions, only: [:index, :new, :create, :destroy]
  root "transactions#index"
end
