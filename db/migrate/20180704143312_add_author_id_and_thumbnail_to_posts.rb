class AddAuthorIdAndThumbnailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :integer, :author_id
    add_column :posts, :file, :thumbnail
  end
end
