class Category < ApplicationRecord
   has_many :publications, dependent: :destroy

end
