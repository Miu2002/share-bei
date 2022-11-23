class FavoritesController < ApplicationController
def index
    @favorite_posts = FavoritePost.all
 end
end
