Rails.application.routes.draw do
  get 'sessions/new'
  root 'top#home'
  get '/books/ajax_book_register'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :borrows, only: [:new, :create]
  resources :returns, only: [:index]
  resources :books
  resources :users
  # For details => https://docs.google.com/spreadsheets/d/15rZsM-0mllq8AsZ6BZhMPqradaahB711-fLVOczP2Xc/edit#gid=0
end
