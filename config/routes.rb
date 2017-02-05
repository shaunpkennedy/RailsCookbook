Rails.application.routes.draw do

  
  resources :users
  resources :recipes
  get "/admin", to: 'admin#index', as: 'admin'
  get "/about", to: 'home#about', as: 'about'
  get "/contact", to: 'home#contact', as: 'contact'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
