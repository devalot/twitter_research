class CreateNotes < ActiveRecord::Migration
  def change
    create_table(:notes) do |t|
      t.column(:note_text, :text,    null: false)
      t.column(:user_id,   :integer, null: false)
      t.column(:tweet_id,  :integer, null: false)
      t.timestamps
    end

    add_index(:notes, :user_id)
    add_index(:notes, :tweet_id)
  end
end
