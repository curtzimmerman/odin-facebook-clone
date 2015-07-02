class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :friendships_to, class_name: "Friendship", foreign_key: "friend_id"
  has_many :friends_to, through: :friendships_to, source: :user

  has_many :recieved_friend_requests, class_name: "FriendRequest", foreign_key: "recipient_id"
  has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id"

  def pending_friend_requests
    self.recieved_friend_requests.where(accepted: false)
  end
	
end