class RenameInviteToPollUser < ActiveRecord::Migration
  def change
    rename_table :invites, :poll_users
    rename_column :votes, :invite_id, :poll_user_id
  end
end
