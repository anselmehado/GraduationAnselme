class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
