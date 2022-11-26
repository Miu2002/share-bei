class FavoritesController < ApplicationController
def index
 @post = Post.all
 end
end
