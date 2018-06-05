class Post < ApplicationRecord
  validates :name, :description, :user, presence: true

  belongs_to :user
end
