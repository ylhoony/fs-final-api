Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: :all # This makes devise_scope available.

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :countries, only: [:index, :create, :show, :update]
        resources :currencies, only: [:index, :create, :show, :update]
        resources :payment_options, only: [:index, :create, :show, :update]
      end

      devise_scope :user do
        get "current_user", to: "api#auth_current_user" # Current User
        post "sign_up", to: "users/registrations#create" # User Sign Up
        post "sign_in", to: "users/sessions#create" # User Sign In
        # delete "sign_out", to: "users/sessions#destroy" # User Sign Out

        patch "users", to: "users/registrations#update"
        put "users", to: "users/registrations#update"
        delete "users", to: "users/registrations#destroy"
        
        post "users/password", to: "users/passwords#create"
        patch "users/password", to: "users/passwords#update"
        put "users/password", to: "users/passwords#update"
      end

      get '/current_account', to: "api#get_current_account"
      put '/current_account', to: "api#update_current_account"

      resources :countries, only: [:index, :show]
      resources :currencies, only: [:index, :show]
      resources :accounts, only: [:index, :create, :show, :update, :destroy]
      resources :employees, only: [:index, :create, :show, :update, :destroy]
      resources :payment_options, only: [:index]
      resources :payment_terms, only: [:index, :create, :show, :update, :destroy]
      resources :warehouses, only: [:index, :create, :show, :update, :destroy]
      resources :account_addresses, only: [:index, :create, :show, :update, :destroy]
      resources :account_contacts, only: [:index, :create, :show, :update, :destroy]

      resources :customers, controller: 'companies/customers', only: [:index, :create, :show, :update, :destroy]
      resources :suppliers, controller: 'companies/suppliers', only: [:index, :create, :show, :update, :destroy]

      resources :product_categories, controller: 'products/product_categories', only: [:index, :create, :show, :update, :destroy]
      resources :product_brands, controller: 'products/product_brands', only: [:index, :create, :show, :update, :destroy]
      resources :products, controller: 'products/products', only: [:index, :create, :show, :update, :destroy]
    end
  end
end
