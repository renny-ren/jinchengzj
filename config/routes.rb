Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :home, only: :index
  resources :sessions, only: :create
  resources :applicants, only: [:new, :index]

  resources :announcements
end
