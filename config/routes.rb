Rails.application.routes.draw do
  root 'pages#hello'
  devise_for :users
end
