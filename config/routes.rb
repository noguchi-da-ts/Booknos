Rails.application.routes.draw do
  get 'borrows/index'
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'top#home'
end
