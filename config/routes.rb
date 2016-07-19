Rails.application.routes.draw do
  devise_for :customers
  root 'pages#home'

  resources :profiles
end
