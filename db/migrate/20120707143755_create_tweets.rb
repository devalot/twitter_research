class CreateTweets < ActiveRecord::Migration
  def change
    create_table(:tweets) do |t|
      t.string(:twitter_user, null: false)
      t.text(:tweeted_text)
      t.datetime(:tweeted_at, null: false)
      t.integer(:user_id,     null: false)
      t.timestamps
    end

    add_index(:tweets, :user_id)
  end
end
