class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :price
      t.string :email
      t.string :edit_url
      t.integer :category_id
      t.timestamps
    end
  end
end
