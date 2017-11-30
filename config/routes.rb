Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'comments/create'
  # post 'search' => 'search#index'
  get '/search' => 'search#index', as: 'search'

  mount ChinaCity::Engine => '/china_city'

  devise_for :users, controllers: {
    registrations: :registrations
  }

  resource :setting do
    get :password
  end

  root 'home#index'

  resources :home, only: :index
  resources :praises

  resources :topics do
    member do
      post :action
    end
    resources :replies do
      resource :comments
    end
  end

  resources :resources do
    collection do
      get :found
    end
  end
  post '/resources/new' => 'resources#new'
  
  resources :nodes
  get '/topics/node/:id' => 'topics#node', as: 'node_topics'

  resources :users, path: '', param: :username do
    member do
      get :topics
      get :replies
      get :followers
      get :following
      get :favorites
      post :follow
      delete :unfollow
    end
  end
end
