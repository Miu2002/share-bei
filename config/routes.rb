Rails.application.routes.draw do
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  
  get 'signup' => "users#new"
  post 'users/:id/update' => "users#update"
  get 'users/:id/edit' => "users#edit"
  post 'users/create' => "users#create"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"
  
  get 'posts/top' => "posts#top"
  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/:id' => "posts#show"
  post 'posts/create' => "posts#create"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"

  get 'shops/index' => "shops#index"
  
  get '/' => "home#top"
  get 'about' => "home#about"
  
  
  
end
