class Post < ActiveRecord::Base

	attr_accessor :picture_cache
	
	belongs_to :user

	has_many :likes
	has_many :comments

	validates :body, length: { minimum: 1 }

	mount_uploader :picture, PictureUploader

	def users_that_like
		users = []
		self.likes.each do |like|
			users << like.user
		end
		users
	end

	def names_of_likers
		likers = []
		self.users_that_like.each do |user|
			likers << user.name
		end
		likers.join(", ")
	end

end
