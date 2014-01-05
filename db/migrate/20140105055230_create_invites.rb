class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :poll, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
