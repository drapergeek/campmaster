Campmaster::Application.routes.draw do
  devise_for :users, controllers: { :invitations => 'users/invitations' }
  resources :users, only: [:index]

  root to: "high_voltage/pages#show", id: "home"
end
