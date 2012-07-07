# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120707172323) do

  create_table "categories", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_tweets", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "tweet_id",    :null => false
  end

  add_index "categories_tweets", ["category_id"], :name => "index_categories_tweets_on_category_id"
  add_index "categories_tweets", ["tweet_id"], :name => "index_categories_tweets_on_tweet_id"

  create_table "notes", :force => true do |t|
    t.text     "note_text",  :null => false
    t.integer  "user_id",    :null => false
    t.integer  "tweet_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "notes", ["tweet_id"], :name => "index_notes_on_tweet_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "tweets", :force => true do |t|
    t.string   "twitter_user", :null => false
    t.text     "tweeted_text"
    t.datetime "tweeted_at",   :null => false
    t.integer  "user_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "full_name",                              :null => false
    t.string   "email",                                  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
