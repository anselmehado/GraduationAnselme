class Comment < ApplicationRecord

   belongs_to :publication
   scope :publication_comment_list, -> (query) {where(publication_id: query)}
end
