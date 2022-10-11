Rails.application.routes.draw do
  # defined the root path, witch will be managed by main controller action index
  root to: 'main#index'
  
  get 'about', to: 'about#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'
end
