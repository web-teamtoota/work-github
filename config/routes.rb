Rails.application.routes.draw do


  namespace :public do
  resources :items
  end
  namespace :admin do
  resources :items
  end

  namespace :admin do
  resources :customers
  end

  namespace :admin do
  resources :orders
  end


    devise_for :users
    devise_for :admins
    devise_for :customers
    devise_for :orders
    devise_for :items


    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
    post 'homes' => 'homes#create'
    get "admin/sign_in", to: "admins/sessions#new"
    get "admin/items" => "admins#index"
    get "admin/customers" => "admins#index"
    get "admin/orders" => "admin#index"
    get "public/items" => "public#index"
    
  

    #get 'admin/index', to: 'admins/items#index'
    #get 'admin/items/new', to: 'admins/items#new'
    #post 'admin/items' , to: 'admins/items#create'
    #get 'admin/items/:id', to: 'admins/items#show'
    #get 'admin/items/:id/edit', to: 'admins/items#edit'
    #patch 'admin/items/:id', to: 'admins/items#update'

    resources :lists
    resources :users
    resources :admins
    resources :customers
    resources :items
    resources :public



    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
