class ShopsController < ApplicationController
   before_action :authenticate_user, { only: [:index, :edit, :update] }
  
   def index
    @user = @current_user
    @shops = Shop.where(shop_category_id: params[:shop_category_id])
    @shop = Favorite.where(user_id: @user).exists?
end

  def show
    @id = params[:shop_id]
    @path = "/shops/#{@id}/posts"
    @path2 = "/shops/#{@id}/posts/new"
    @shops = Shop.find_by(id: params[:shop_id])
    @posts = Post.where(shop_id: params[:shop_id])
    @posts = Post.order(updated_at: :desc).limit(2)

    @post = Favorite.where(user_id: @user).exists?

    @average_shop_posts = @posts.average(:rate).to_f.round(1)
  end
end 