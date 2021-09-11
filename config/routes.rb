Rails.application.routes.draw do
  root "publications#index"
  resources :favorites
  resources :publications
  resources :comments
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
