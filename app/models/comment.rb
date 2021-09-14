class Comment < ApplicationRecord

   belongs_to :publications
   scope :publication_comment_list, -> (query) {where(publication_id: query)}
   validates :content, presence: true
   validates :name, presence: true
   validates :email, presence: true
end
