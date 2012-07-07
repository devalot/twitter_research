class Tweet < ActiveRecord::Base
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at)

  validates(:twitter_user, presence: true)
  validates(:tweeted_at,   presence: true)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    words = tweeted_text.gsub(/#/, '').split(/\s+/)
    categories = Category.limit(30).all

    words.inject([]) do |collector, word|
      match = categories.detect {|c| c.title_match?(word)}
      collector << match.title if match
      collector
    end.sort.join(', ')
  end
end
