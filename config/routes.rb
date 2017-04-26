Rails.application.routes.draw do
  root 'pages#index'

  resources :pages
  resources :sessions
  resources :applicants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
