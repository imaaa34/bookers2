Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
