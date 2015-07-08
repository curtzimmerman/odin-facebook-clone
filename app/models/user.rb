class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook] 

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image_url = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
	
end