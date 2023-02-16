Rails.application.routes.draw do
  namespace :admins do

  end
  devise_for :users
  devise_for :admins
  root to: 'homes#top'


  get "homes/about" => "homes#about", as: "about"
  post 'homes' => 'homes#create'
  devise_scope :admin do
    get "admin/sign_in", to: "admins/sessions#new"

    get 'admin/index', to: 'admins/items#index'
    get 'admin/items/new', to: 'admins/items#new'
    post 'admin/items' , to: 'admins/items#create'
    get 'admin/items/:id', to: 'admins/items#show'
    get 'admin/items/:id/edit', to: 'admins/items#edit'
    patch 'admin/items/:id', to: 'admins/items#update'
  end


  resources :lists, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

