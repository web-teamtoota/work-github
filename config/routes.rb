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



#   resources :orders

    resources :order_details, only:[:update]
patch "order_details/:id" => "order_details#update",as:"order_detail"
patch "orders/:id" => "orders#update",as:"order"
get "orders/:id" => "orders#show"
# put "customers/:id" => "customer#show"

# get "order_details/:id" => "orders#update"
#  get "admin/order_details/:id" => "admin/orders#update"

  #resources :sessions
  #get "admin/sign_in" => "admins#new"
  #post "admin/sign_in" => "admins#create"
  #delete "admin/sign_out" => "admins#destroy"
  end

  # get "admin/customers" => "admin/customers#index"
  # get "admin/customers/:id" => "admin/customers/:id#show"
  # get "/admin/customers/:id/edit" => "/admin/customers/:id/edit#edit"
  # patch "/admin/customers/:id/" => "/admin/customers/:id#update"
  # patch "/admin/customers/:id/" => "/admin/customers/:id#update"



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
  #patch  "customer/edit" => "customers#edit"
  patch "customer" => "customers#update"
  get "customer/unsubscribe" => "customers#unsubscribe",as: "unsubscribe"
  patch "customer/withdraw" => "customers#withdraw"
  # 論理削除用のルーティング
  #get "customer/withdraw" => "customers#withdraw"

  resources :items
#   get "items/:id" => "item#show"
  #resources :orders
  get "orders/new" => "orders#new"
  post "orders/confirm" => "orders#confirm"
  get "orders/thanks" => "orders#thanks"
#   post "orders/thanks" => "orders#thanks"
  post "orders" => "orders#create"
#   get "orders" => "orders#index"
#   get "orders/:id" => "orders#show"
  resources :orders, only: [:index, :show]
  # resources :customers, only: [:show, :edit, :update]



  #get "customer/sign_up" => "customers#new"
  #post "customer" => "customers#create"
  # get "cart_items" => "cart_items#index"
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  # get  "cart_items/:id" => "cart_items#update"
  # patch "cart_items/:id" => "cart_items#update"
  # patch "cart_items/:id" => "cart_items#update"
#   delete "cart_items/:id" => "cart_items#destroy"
  # delete  "cart_items" => "cart_items#destroy_all"
# post "cart_items" => "cart_items#create"
# patch 'cart_items/:id', to: 'cart_items#update'
  # resources :cart_items, only: [:destroy]

  resources :addresses
  resources :cart_items

  end




  #get 'admin/index', to: 'admins/items#index'
    #get 'admin/items/new', to: 'admins/items#new'
    #post 'admin/items' , to: 'admins/items#create'
    #get 'admin/items/:id', to: 'admins/items#show'
    #get 'admin/items/:id/edit', to: 'admins/items#edit'
    patch 'admin/items/:id', to: 'admins/items#update'



    #root to: 'homes#top'
    #get "/about" => "homes#about", as: "about"
    post 'homes' => 'homes#create'
    #get "admin/items" => "admins#index"
    #post 'admin/items' , to: 'admins/items#create'
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
