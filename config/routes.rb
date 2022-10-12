Rails.application.routes.draw do
  # defined the root path, witch will be managed by main controller action index
  root to: 'main#index'
  
  get 'about', to: 'about#index'
  
  # sign_up routes
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'  

  #sign_in routes
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  # log_out route
  delete 'logout', to: 'sessions#destroy'
end
