Campmaster::Application.routes.draw do
  devise_for :users, controllers: { :invitations => 'users/invitations' }
  resources :users, only: [:index, :destroy]
  resources :receipts, only: [:new, :create, :index, :show]

  root to: "high_voltage/pages#show", id: "home"
end
