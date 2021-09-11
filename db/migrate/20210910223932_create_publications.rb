class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :content
      t.text :image
      t.date :date

      t.timestamps
    end
  end
end
