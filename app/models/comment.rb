class Comment < ApplicationRecord
  validates :user, :post, :comment_body, presence: true

  belongs_to :user
  belongs_to :post
end
