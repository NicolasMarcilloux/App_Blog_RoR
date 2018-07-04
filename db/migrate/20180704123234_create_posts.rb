class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :publication_date
      t.string :header
      t.string :author_id
      t.file :thumbnail

      t.timestamps
    end
  end
end
