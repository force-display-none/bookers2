Rails.application.routes.draw do
  get '/' => 'books#top'
  # get '/' => 'devise/sessions#new'
  resources :users, only: [:show]
  # resources :post_images, only: [:new, :create, :index, :show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
