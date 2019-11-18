class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :albums
  has_many :posts

  validates :name, presence: true, length: { maximum: 6 }
  validates :encrypted_password, length: { minimum: 8 }
end
