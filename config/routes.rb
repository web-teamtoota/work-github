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

  namespace :admin do
  root to: 'homes#top'
  resources :items
  resources :customers
  resources :order_details, only:[:update]
# patch "order_details/:id" => "order_details#update",as:"order_detail"
patch "orders/:id" => "orders#update",as:"order"
get "orders/:id" => "orders#show"
  end

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
  get "orders/new" => "orders#new"
  post "orders/confirm" => "orders#confirm"
  get "orders/thanks" => "orders#thanks"
  post "orders" => "orders#create"
  resources :orders, only: [:index, :show]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :addresses
  resources :cart_items
  end
  patch 'admin/items/:id', to: 'admins/items#update'
    post 'homes' => 'homes#create'
    get "admin/customers" => "admins#index"
    get "admin/orders" => "admin#index"
    get "public/items" => "public#index"
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end