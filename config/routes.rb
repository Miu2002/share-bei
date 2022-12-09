Rails.application.routes.draw do
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  get 'logout' => "users#logout"
  
  get 'signup' => "users#new"
  post 'users/:id/update' => "users#update"
  get 'users/:id/edit' => "users#edit"
  post 'users/create' => "users#create"
  # get 'users/index' => "users#index"
  get 'users/:id' => "users#show",as: :user
  
  get 'posts/top' => "posts#top"
  # get 'posts/index' => "posts#index"
  # get 'posts/new' => "posts#new"
  # get 'posts/:id' => "posts#show"
  # post 'posts/create' => "posts#create"
  # get 'posts/:id/edit' => "posts#edit"
  # post 'posts/:id/update' => "posts#update"
  # post 'posts/:id/destroy' => "posts#destroy"

  get 'shops/index/:shop_category_id' => "shops#index"
  get 'shops/:shop_id' => "shops#show", as: :shop
  get 'shops/:shop_id/posts' => "posts#index",as: :shop_posts
  get 'shops/:shop_id/posts/new' => "posts#new", as: :new_comment
  post 'shops/:shop_id/posts/new' => "posts#create"
  get  'shops/:shop_id/posts/:post_id' => "posts#show",as: :shop_post
  get  'shops/:shop_id/posts/:post_id/edit' =>  "posts#edit",as: :edit_shop_post
  post 'shops/:shop_id/posts/:post_id/update' => "posts#update"
  post 'shops/:shop_id/posts/:post_id/destroy' => "posts#destroy",as: :destroy_shop_post

  
  get '/' => "home#top"
  get 'about' => "home#about"

  get 'favorites/index' => "favorites#index"
  
  resources :posts do
    resource :favorites_post, only: [:create, :destroy]
  end

  resources :shops do
    resource :favorites_shop, only: [:create]
  end
 

end
