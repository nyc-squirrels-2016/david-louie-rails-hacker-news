class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_votes

  validates :title, presence: true
  validates :url, presence: true

  def vote_count
    self.post_votes.count
  end
end
