class AddPublicationRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :publication, foreign_key: true
  end
end
