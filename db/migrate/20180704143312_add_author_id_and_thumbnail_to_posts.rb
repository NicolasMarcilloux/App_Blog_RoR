class AddAuthorIdAndThumbnailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer
    add_column :posts, :thumbnail, :string
  end
end
