Rails.application.routes.draw do
  devise_for :users
  get '/top' => 'homes#top'
  
  get "homes/about" => "homes#about", as: "about"
  post 'homes' => 'homes#create'
  resources :lists, only: [:new, :create, :index, :show, :edit, :destroy]
    resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
