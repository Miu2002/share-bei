class ShopsController < ApplicationController
  def index
    @shops = Shop.where(shop_category_id: params[:shop_category_id])
  end

  def show
    @id = params[:shop_id]
    @path = '/shops/' + @id + '/posts'
    @path2 = '/shops/' + @id + '/posts/new'
    @shops = Shop.find_by(id: params[:shop_id])
    @posts = Post.where(shop_id: params[:shop_id])
  end
end
