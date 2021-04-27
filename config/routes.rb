Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about'
  resources :books, except: [:new]
  resources :users, only: [:index, :create, :edit, :show, :update]
  post 'users/:id' => 'users#create'
  post 'books/:id' => 'books#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
