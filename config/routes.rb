Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces
  resources :stores do
    resources :shifts
    resources :members do
      collection do
        get 'search'
      end
      resources :admins
    end

    
  end
  
end
