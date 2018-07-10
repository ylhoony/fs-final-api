Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: :all # This makes devise_scope available.

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :countries, only: [:index, :create, :show, :update]
        resources :currencies, only: [:index, :create, :show, :update]
      end

      resources :countries, only: [:index, :show]
      resources :currencies, only: [:index, :show]
      resources :companies, only: [:index, :create, :show, :update, :destory]
      resources :employees, only: [:index, :create, :show, :update, :destory]

      devise_scope :user do
        get "current_user", to: "api#current_user_id" # Current User
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

    end
  end

end
