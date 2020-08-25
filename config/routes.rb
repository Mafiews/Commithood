Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: [:destroy, :show, :index, :create] do
    resources :participation, only: [:create]
  end

  get 'dashboard', to: 'pages#dashboard'
end