class DropPollUsers < ActiveRecord::Migration
  def change
    add_reference :votes, :user, index: true
    add_reference :votes, :poll, index: true
    add_index :votes, [:user_id, :poll_id]
    remove_reference :votes, :poll_users
    drop_table :poll_users
  end
end
