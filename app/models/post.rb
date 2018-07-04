class Post < ActiveRecord::Base
    belongs_to :user, foreign_key: :author_id
    mount_uploader :file, ThumbnailUploader
end
