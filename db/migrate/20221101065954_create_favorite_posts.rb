class CreateFavoritePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_posts do |t|
      t.string :user_id
      t.string :posts_id

      t.timestamps
    end
  end
end
