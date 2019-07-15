Rails.application.routes.draw do
  root 'notes#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resource :users, only: :create
  resources :notes

  resources :tags, only: :destroy do
    get :notes, on: :member
  end
end
