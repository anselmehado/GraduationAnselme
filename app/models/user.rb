class User < ApplicationRecord
  has_many :publications, dependent: :destroy

  has_many :favorites, dependent: :destroy
end
