Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  get "api/authors/select2", to: "api/authors#select2"
  get "api/book_categories/select2", to: "api/book_categories#select2"
  get "api/publishers/select2", to: "api/publishers#select2"

  namespace :api do
    resources :authors
    resources :book_categories
    resources :books
    resources :users
    resources :publishers

    get "summaries", to: "summaries#index"
    get "login_user", to: "summaries#login_user"
  end
end
