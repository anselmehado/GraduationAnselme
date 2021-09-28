Rails.application.routes.draw do

  get 'homes/index'
  authenticate :user, lambda { |u| u.user_role == "admin" } do
      mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    end
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :favorites
  resources :publications
  resources :comments
  resources :categories
  root to: "homes#index"


  resources :publications do
  resources :comments
  end

end
