Rails.application.routes.draw do
  root 'pages#hello'
  devise_for :users

  get 'dashboard', to: 'dashboard#index'
end
