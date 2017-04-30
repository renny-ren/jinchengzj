Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations
  }

  root 'home#index'

  resources :home, only: :index
  resources :announcements
end
