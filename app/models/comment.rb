class Comment < ApplicationRecord

   belongs_to :publications, optional: true
   #belongs_to :publications
   scope :publication_comment_list, -> (query) {where(publication_id: query)}
   validates :content, presence: true
   validates :name,  presence: true, length: { maximum: 30 }
   validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
 before_validation { email.downcase! }
end
