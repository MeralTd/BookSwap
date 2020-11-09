Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :comments do
      collection do
        put :approve
      end
    end
  end
  get 'user_notifications/index'

  get 'swaps/:id/accept', to: 'swaps#accept', as: :swap_accepted
  
  get 'swaps/:id/decline', to: 'swaps#decline', as: :swap_declined
  
  post 'swaps/:book_id,:other_book_id', to: 'swaps#create', as: :swaps
  
  get 'search-results/:id', to: 'welcome#index', as: :search

  resources :users
  get "/users" => "users#index"

  get "/show/:user_id" => "users#show", :as => :user_profile
  root 'welcome#index'
  get '/dashboard', to: 'welcome#dashboard'
  get '/wishlist', to: 'welcome#wishlist'

  
end
