class RenamePostsIdColumnToFavoritePosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :favorite_posts, :posts_id, :post_id
  end
end
