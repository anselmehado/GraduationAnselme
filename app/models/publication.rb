class Publication < ApplicationRecord

  belongs_to :category

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy



end
