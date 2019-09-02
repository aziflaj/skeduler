Rails.application.routes.draw do
  root 'pages#hello'
  devise_for :users

  get 'dashboard', to: 'dashboard#index'

  get 'free_slots', to: 'slots#free'
  get 'upcoming_meetings', to: 'slots#upcoming'
end
