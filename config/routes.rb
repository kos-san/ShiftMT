Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  resources :spaces
end
