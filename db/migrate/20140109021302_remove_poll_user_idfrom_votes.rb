class RemovePollUserIdfromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :poll_user_id
  end
end
