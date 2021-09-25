Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :favorites
  resources :publications
  resources :comments
  resources :categories
  root to: "publications#index"


  resources :publications do
  resources :comments
  end

end
