Rails.application.routes.draw do


  #namespace :public do
  #resources :items
  #end

 #namespace :public do
 #resources :orders
 #end

  namespace :admin do
  root to: 'homes#top'
  resources :items
  resources :customers
  resources :orders
  end

  scope module: :public do
  root to: 'homes#top'
  get "about" => "homes#about"
  get "customer/sign_up" => "customers#new"
  post "customer" => "customers#create"
  resources :items
  resources :orders
  resources :sessions
  get "customer/sign_up" => "customers#new"
  post "customer" => "customers#create"
  get "customer" => "customers#show"
  get "customer/edit" => "customers#edit"
  patch "customer" => "customers#update"
  get "customer/unsubscribe" => "customers#unsubscribe"
  patch "customer/withdraw" => "customers#withdraw"
  end

 

  #get 'admin/index', to: 'admins/items#index'
    #get 'admin/items/new', to: 'admins/items#new'
    #post 'admin/items' , to: 'admins/items#create'
    #get 'admin/items/:id', to: 'admins/items#show'
    #get 'admin/items/:id/edit', to: 'admins/items#edit'
    #patch 'admin/items/:id', to: 'admins/items#update'

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 
    #root to: 'homes#top'
    #get "/about" => "homes#about", as: "about"
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

    #resources :lists
    #resources :users
    #resources :admins
    #resources :customers
    #resources :items
    #resources :publics
    #resources :orders



    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
