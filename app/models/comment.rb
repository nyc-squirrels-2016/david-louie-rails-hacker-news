class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, touch: true
  has_many :comment_votes

  validates :content, presence: true
end
