class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.integer :rate, null: false
      t.boolean :is_recommendable, null: false, default: false

      t.timestamps
    end
  end
end
