Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: :index
  resources :sessions, only: :create
  resources :applicants, only: :new

  resources :announcements

end
