class ShopsController < ApplicationController
  def index
    @shops = Shop.where(shop_category_id: params[:shop_category_id])
  end

  def show
    @id = params[:shop_id]
    @path = "/shops/#{@id}/posts"
    @path2 = "/shops/#{@id}/posts/new"
    @shops = Shop.find_by(id: params[:shop_id])
    @posts = Post.where(shop_id: params[:shop_id])

    @user = @current_user.id
    @post = Favorite.where(user_id: @user).exists?

    @average_shop_posts = @posts.average(:rate).to_f.round(1)
  end
end
