class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :friendships_to, class_name: "Friendship", foreign_key: "friend_id"
  has_many :friends_to, through: :friendships_to, source: :user
	
end