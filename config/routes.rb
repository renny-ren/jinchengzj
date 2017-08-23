Rails.application.routes.draw do
  mount ChinaCity::Engine => '/china_city'

  devise_for :users, controllers: {
    registrations: :registrations
  }

  resource :setting do
    get :password
  end

  root 'home#index'


  resources :home, only: :index
  resources :announcements
  resources :praises

  resources :topics do
    resources :replies
  end
  resources :nodes

  resources :users, path: '', param: :username do
    member do
      get :topics
      get :replies
      get :followers
      get :following
      get :favorites
    end
  end
end
