class Category < ApplicationRecord
  validates :name, presence: true
  #validates :title, presence: true
  has_many :publications, dependent: :destroy

end
