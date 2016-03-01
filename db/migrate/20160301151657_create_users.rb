class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, null: false
      t.string :email, unique: true, index: true, null: false
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
