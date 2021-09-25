class Publication < ApplicationRecord

  belongs_to :category
  #belongs_to :user
  belongs_to :user, :optional => true
  mount_uploader :image, ImageUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy


  def pub_image
  if image.present?
    image.url
  else
    "blog2.png"
  end
  end



end
