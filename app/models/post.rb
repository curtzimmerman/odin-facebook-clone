class Post < ActiveRecord::Base
	belongs_to :user

	has_many :likes

	validates :body, length: { minimum: 1 }

	def users_that_like
		users = []
		self.likes.each do |like|
			users << like.user
		end
		users
	end

end
