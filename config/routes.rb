Rails.application.routes.draw do
  resources :recept_connects
  resources :recepts
  resources :recept_types
  resources :planers
  root 'page#index'
  get 'page/index'
  get 'page/about'

  resources :products
  resources :materials
  resources :sizes
  resources :material_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
