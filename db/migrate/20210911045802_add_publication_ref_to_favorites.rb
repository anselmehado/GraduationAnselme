class AddPublicationRefToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :publication, foreign_key: true
  end
end
