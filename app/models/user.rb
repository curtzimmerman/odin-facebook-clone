class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :recieved_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id"
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id"

  has_many :posts
  has_many :likes
  has_many :comments
  
  def pending_friend_requests
    self.recieved_friend_requests.where(accepted: false)
  end

  def feed
    Post.where("user_id IN (?)", self.friends.ids << self.id).order(created_at: :desc)
  end
	
end