class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_votes
  has_many :comment_votes

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
