class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
    	t.references :friendship
    	t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
