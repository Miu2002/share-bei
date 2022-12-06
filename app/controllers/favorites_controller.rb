class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(shop_id: params[:shop_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:shop_id])
    @favorite = current_user.favorites.find_by(shop_id: @shop.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
