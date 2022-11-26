class ShopsController < ApplicationController
def index
    @shops = Shop.find_by(id: params[:shop_id])
  end
 

 def show
    @shops = Shop.find_by(id: params[:shop_category_id])
 end


end


