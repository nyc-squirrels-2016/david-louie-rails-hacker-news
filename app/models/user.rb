class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_votes
  has_many :comment_votes

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def voted_post?(post)
    post.post_votes.pluck(:user_id).include?(self.id)
  end

  def voted_comment?(comment)
    post.post_votes.pluck(:user_id).include?(self.id)
  end
end
