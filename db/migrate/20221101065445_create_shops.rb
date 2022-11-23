class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.references :shop_category, null: false, foreign_key: true
      t.string :address, null: false
      t.string :access, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
