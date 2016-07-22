Rails.application.routes.draw do

  resources :profiles do
    collection do
      get :search
    end
  end

  resources :messages, except: [:destroy, :edit]


  devise_for :customers
  root 'pages#home'

end
