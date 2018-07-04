class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id
	validates :email, presence: true

	def full_name
		"#{first_name.capitalize} #{last_name.capitalize}"
	end
end
