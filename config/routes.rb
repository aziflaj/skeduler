Rails.application.routes.draw do
  root 'pages#hello'
  devise_for :users

  get 'dashboard', to: 'dashboard#index'

  resources :slots, only: :create do
    collection do
      get 'free'
      get 'upcoming'
    end
  end
end
