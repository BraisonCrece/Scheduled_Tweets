Rails.application.routes.draw do

  # defined the root path, witch will be managed by main controller action index
  root to: 'main#index'
  
  # about page route
  get 'about', to: 'about#index'
  
  # password update routes
  get 'password', to: 'passwords#edit', as: :edit_password # We are telling rails that we want to set the path helper as edit_password_pass
  patch 'password', to: 'passwords#update'

  # password reset route
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  

  # sign_up routes
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'  

  #sign_in routes
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  # log_out route
  delete 'logout', to: 'sessions#destroy'

  # omniauth twitter routes
  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts
end
