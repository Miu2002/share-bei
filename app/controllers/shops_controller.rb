class ShopsController < ApplicationController
def index
    @shops = Shop.all
 end

 def show
    @shop = Shop.find_by(id: params[:shop_id])
 end

end


