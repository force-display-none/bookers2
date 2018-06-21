Rails.application.routes.draw do

  devise_for :users

  resources :users
  get '/' => 'books#top', as: 'top'
  get '/about' => 'books#about', as: 'about'
  root 'books#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
