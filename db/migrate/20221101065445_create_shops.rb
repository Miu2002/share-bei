class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :shop_category_id
      t.string :address
      t.string :access
      t.string :phone_number

      t.timestamps
    end
  end
end
