class AddCategoryRefToPublications < ActiveRecord::Migration[5.2]
  def change
    add_reference :publications, :category, foreign_key: true
  end
end
