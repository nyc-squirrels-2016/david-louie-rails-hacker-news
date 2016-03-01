class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
