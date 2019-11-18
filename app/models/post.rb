class Post < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
