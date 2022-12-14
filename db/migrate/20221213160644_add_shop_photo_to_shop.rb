class AddShopPhotoToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :shop_photo, :string
  end
end
