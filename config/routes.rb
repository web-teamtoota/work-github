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

  get "customer" => "customers#show"
  get "customer/edit" => "customers#edit"
  patch "customer" => "customers#update"
  get "customer/unsubscribe" => "customers#unsubscribe",as: "unsubscribe"
  patch "customer/withdraw" => "customers#withdraw"
  # 論理削除用のルーティング
  #get "customer/withdraw" => "customers#withdraw"

  resources :items
  #resources :orders
  get "orders/new" => "orders#new"
  post "orders/confirm" => "orders#confirm"
  get "orders/thanks" => "orders#thanks"
  post "orders" => "orders#create"
  get "orders" => "orders#index"
  get "orders/:id" => "orders#show"


  #get "customer/sign_up" => "customers#new"
  #post "customer" => "customers#create"

  #resources :cart_items
  get "cart_items" => "cart_items#index"
  patch "cart_items/:id" => "cart_items#update"
  delete "cart_items/:id" => "cart_items#destroy"
  delete "cart_items" => "cart_items#destroy_all"
  post "cart_items" => "cart_items#create"

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
    #get "admin/items" => "admins#index"
    #post 'admin/items' , to: 'admins/items#create'
    get "admin/customers" => "admins#index"
    get "admin/orders" => "admin#index"
    get "public/items" => "public#index"

    get "admin/order/:id" => "admin/orders#show"
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
