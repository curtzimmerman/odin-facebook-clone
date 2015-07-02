class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
    	t.references :sender, class_name: "User"
    	t.references :recipient, class_name: "User"
    	t.boolean :accepted

      t.timestamps null: false
    end

    add_column :friendships, :friend_request_id, :integer
  end
end
