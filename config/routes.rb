Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'sessions/new'
  devise_for :users

  resources :favorites
  resources :publications
  resources :comments
  resources :categories
  root to: "publications#index"


  resources :publications do
  resources :comments
  end

  namespace :admin do
  resources :users
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  #mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
