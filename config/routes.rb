Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :books
  get '/' => 'books#top', as: 'top'
  get '/about' => 'books#about', as: 'about'
  # post '/books/:id' => 'books#index'
  # get '/books/index' => 'books#index', as: 'books_index'
  root 'books#top'
  get '/home' => 'users#home', as: 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
