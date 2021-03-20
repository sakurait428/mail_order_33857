Rails.application.routes.draw do

  root to: 'items#index'
  get 'item_category_one', to: 'items#category_one'
  get 'item_category_two', to: 'items#category_two'
  get 'item_category_three', to: 'items#category_three'
  get 'purchase_record', to: 'items#purchase_record'

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :carts, only: [:show] do
    resources :orders, only: [:index, :new, :create]
  end

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'
  
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
