Rails.application.routes.draw do
  
  root 'categories#index'

  get 'user/:id', to: 'users#show', as: 'user_profile'

  devise_for :users

  resources :categories do
    resources :products do
      resources :reviews
    end
  end

end
