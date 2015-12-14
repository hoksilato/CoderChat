class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps null: false
    end
    add_index :friends, :from_id
    add_index :friends, :to_id
    add_index :friends, [:from_id, :to_id], unique: true
  end
end
