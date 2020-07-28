Rails.application.routes.draw do
  root 'top#home'
  get '/books/ajax_book_register'

  resources :borrows, only: [:new, :create]
  resources :returns, only: [:new, :create]
  resources :books
  resources :users
  # For details => https://docs.google.com/spreadsheets/d/15rZsM-0mllq8AsZ6BZhMPqradaahB711-fLVOczP2Xc/edit#gid=0
end
