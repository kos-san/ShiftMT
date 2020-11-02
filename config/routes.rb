Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces do
    collection do
      get 'infomation'
    end
  end
  resources :stores do
    resources :contacts
    resources :tables
    resources :shifts
    resources :members do
      collection do
        get 'search'
      end
      resources :admins
    end

    
  end
  
end
