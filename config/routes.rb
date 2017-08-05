Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations
  }

  mount ChinaCity::Engine => '/china_city'

  root 'home#index'

  resources :home, only: :index
  resources :announcements
end
