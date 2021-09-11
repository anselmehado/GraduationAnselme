Rails.application.routes.draw do
  resources :favorites
  resources :publications
  resources :comments
  resources :users
  resources :categories
  root "publications#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
