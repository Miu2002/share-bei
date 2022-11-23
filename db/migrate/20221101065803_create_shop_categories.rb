class CreateShopCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :shop_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
