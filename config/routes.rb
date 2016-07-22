Rails.application.routes.draw do

  resources :profiles do
    collection do
      get :search
    end
    resources :messages, except: [:destroy, :edit] do
      collection do
	get :outbox
      end
    end
  end



  devise_for :customers
  root 'pages#home'

end
