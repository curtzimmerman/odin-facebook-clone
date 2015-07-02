class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
    	t.references :sender, class_name: "User"
    	t.references :recipient, class_name: "User"
    	t.references :friendship
    	t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
