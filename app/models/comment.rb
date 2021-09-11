class Comment < ApplicationRecord
  comments   belongs_to :publication
end
