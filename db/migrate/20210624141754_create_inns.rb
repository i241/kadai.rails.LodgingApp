class CreateInns < ActiveRecord::Migration[6.1]
  def change
    create_table :inns do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :price
      t.string :address
      t.string :image_id

      t.timestamps
    end
  end
end
