class Note < ActiveRecord::Base
  attr_accessible(:note_text)
  validates(:note_text, presence: true)
  belongs_to(:tweet)
  belongs_to(:user)
end
