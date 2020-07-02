class AddFriendsCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :friends_count, :int, default: 0
  end
end
