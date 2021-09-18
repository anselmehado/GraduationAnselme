Rails.application.routes.draw do

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
  #mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
