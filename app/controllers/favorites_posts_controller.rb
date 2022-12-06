class FavoritesPostsController < ApplicationController
  def create
    @post_favorite = FavoritePost.find_or_initialize_by(user_id: @current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_back fallback_location: shop_path(params[:post_id])
  end

  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_back fallback_location: shop_path(params[:post_id])
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
