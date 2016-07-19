Rails.application.routes.draw do
  get 'profiles/show'

  get 'profiles/search'
  
  devise_for :customers
  root 'pages#home'

  resources :profiles
end
