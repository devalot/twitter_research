class RemoveUserIdFromNotes < ActiveRecord::Migration
  def up
    remove_column(:notes, :user_id)
  end

  def down
    add_column(:notes, :user_id, :integer, null: false)
  end
end
