class Comment < ApplicationRecord

   has_many :publications
   scope :publication_comment_list, -> (query) {where(publication_id: query)}
end
