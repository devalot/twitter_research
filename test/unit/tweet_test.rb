################################################################################
require('test_helper')

################################################################################
class TweetTest < ActiveSupport::TestCase

  ##############################################################################
  setup do
    %w(Business Personal Money Entertainment).each do |title|
      Category.create!(title: title)
    end
  end

  ##############################################################################
  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "I wish I could get my business off the ground #money"
    end

    expect = "Business, Money"
    assert_equal(expect, tweet.suggested_categories)
    assert_equal(expect, tweet.suggested_categories_no_inject)
    assert_equal(expect, tweet.suggested_categories_slow)
    assert_equal(expect, tweet.suggested_categories_slow_no_inject)
    assert_equal(expect, tweet.suggested_categories_using_index)
    assert_equal(expect, tweet.suggested_categories_database)
  end

  ##############################################################################
  test("no duplicate categories are suggested") do
    tweet = Tweet.new(tweeted_text: "business business business")
    assert_equal("Business", tweet.suggested_categories)
  end

  ##############################################################################
  test("a blank string is returned when there are no matches") do
    tweet = Tweet.new(tweeted_text: "no matching category name")
    assert_equal("", tweet.suggested_categories)
  end

  ##############################################################################
  def test_setting_categories_from_a_string
    tweet = Tweet.new
    cat = Category.where(title: "Business").first
    assert(cat)

    tweet.categories << cat
    assert_equal(1, tweet.categories.size)

    tweet.categories_as_string = "Money, Personal"
    assert_equal(2, tweet.categories.size)
    assert_equal(%w(Money Personal),
                 tweet.categories.map(&:title).sort)
  end
end
