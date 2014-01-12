class CreatePollInvites < ActiveRecord::Migration
  def change
    create_table :poll_invites do |t|
      t.references :poll, index: true
      t.integer :uid

      t.timestamps
    end
  end
end
