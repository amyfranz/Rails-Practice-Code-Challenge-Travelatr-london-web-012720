Rails.application.routes.draw do

  get 'posts/like'

  resources :posts
  resources :bloggers
  resources :destinations, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
