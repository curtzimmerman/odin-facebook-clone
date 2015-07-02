class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
    	t.references :user
    	t.references :friend, class_name: "User"

      t.timestamps null: false
    end
  end
end
