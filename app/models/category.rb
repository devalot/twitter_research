class Category < ActiveRecord::Base
  attr_accessible(:title)
  validates(:title, presence: true, uniqueness: true)
  has_and_belongs_to_many(:tweets)

  def title_match? (other)
    title.downcase == other.downcase
  end
end
