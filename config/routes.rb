Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: [:destroy, :show, :index, :new, :create] do
    resources :participations, only: [:create]
    member do
      put 'like', to: 'events#like'
      put 'unlike', to: 'events#unlike'
      put 'like_home', to: 'events#like_home'
      put 'unlike_home', to: 'events#unlike_home'
      put 'like_dashboard', to: 'events#like_dashboard'
      put 'unlike_dashboard', to: 'events#unlike_dashboard'
    end
  end

  get 'dashboard', to: 'pages#dashboard'
  resources :ngos, only: [:show, :new, :create] do
    member do
      put 'follow', to: 'ngos#follow'
      put 'unfollow', to: 'ngos#unfollow'
    end
  end
end
