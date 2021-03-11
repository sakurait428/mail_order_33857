Rails.application.routes.draw do

  root to: 'items#index'

  resources :items
  resources :categories, only: [:new, :create, :edit, :update, :destroy]
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
end
