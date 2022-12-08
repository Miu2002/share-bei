class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.find_or_initialize_by(user_id: @current_user.id, shop_id: params[:shop_id])
    @favorite.save
    redirect_back fallback_location: { controller: "shops", action: "index"}
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end



  