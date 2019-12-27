class Album < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :name, :color, presence: true
end
