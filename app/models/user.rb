class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings_user, through: :follower, source: :followed
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower_user, through: :followed, source: :follower
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :name, presence: true
  validates :introduction, length: {maximum: 50}

  attachment :profile_image, destroy: false

def follow_user(user_id)
    follows.find_by(user_id: user_id)
end


def follow(user_id)
  follower.create(followed_id: user_id)
end

def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

def following?(user)
  followings_user.include?(user)
end

end
