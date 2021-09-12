class Category < ApplicationRecord
   has_many :publications, dependent: :destroy

#    enum name: {
#   politique: 0,
#   sante: 1,
#   economie: 2
# }
end
