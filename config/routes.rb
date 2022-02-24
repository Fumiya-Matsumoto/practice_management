Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index]  #この行を追加
  get "users/:id" => "users#main"
  get "users/:id/:year/:month" => "users#show"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "/" => "home#top"
  get "about" => "home#about"
end
