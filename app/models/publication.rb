class Publication < ApplicationRecord
  # belongs_to :user
   belongs_to :category

  belongs_to :user, :optional => true
  #has_many :categories
  mount_uploader :image, ImageUploader


end
