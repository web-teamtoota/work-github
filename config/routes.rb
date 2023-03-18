Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
 }

# # 管理者用
# # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
 }

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

  #resources :sessions
  #get "admin/sign_in" => "admins#new"
  #post "admin/sign_in" => "admins#create"
  #delete "admin/sign_out" => "admins#destroy"
  end

  #get "admin/order" => "admin/orders#show"
  #patch "admin/order" => "admin/orders#update"
  #patch "admin/order_details" => "admin/order_details/:id#update"


  scope module: :public do
  root to: 'homes#top'
  get "about" => "homes#about"
  get "customer/sign_up" => "customers#new"
  post "customer" => "customers#create"
  resources :items
  resources :orders
  #get "customer/sign_up" => "customers#new"
  #post "customer" => "customers#create"
  get "customer" => "customers#show"
  get "customer/edit" => "customers#edit"
  patch "customer" => "customers#update"
  get "customer/unsubscribe" => "customers#unsubscribe"
  patch "customer/withdraw" => "customers#withdraw"
  resources :cart_items
  resources :addresses
  end



  #get 'admin/index', to: 'admins/items#index'
    #get 'admin/items/new', to: 'admins/items#new'
    #post 'admin/items' , to: 'admins/items#create'
    #get 'admin/items/:id', to: 'admins/items#show'
    #get 'admin/items/:id/edit', to: 'admins/items#edit'
    #patch 'admin/items/:id', to: 'admins/items#update'



    #root to: 'homes#top'
    #get "/about" => "homes#about", as: "about"
    post 'homes' => 'homes#create'
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
