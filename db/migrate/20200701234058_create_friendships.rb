class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id, null: false, index: true
      t.integer :friend_id, null: false, index: true

      t.timestamps
    end
  end
end
