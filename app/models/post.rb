class Post < ApplicationRecord
  validates :name, :description, :user, presence: true
  validates :link, url: { allow_nil: true }

  belongs_to :user
end
