class AddColumnsToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :allow_write_in, :boolean
    add_column :polls, :expires_at, :datetime
  end
end
