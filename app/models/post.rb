require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, :length => { :minimum => 250 }
  validates :summary, :length => { :maximum => 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    if self.title.to_s.include?("Won't Believe")
      return true
    elsif self.title.to_s.include?("Secret")
      return true
    elsif self.title.to_s.include?("Top [number]")
      return true
    elsif self.title.to_s.include?("Guess")
      return true
    else
      errors.add(:title, "not clickbait")
    end
  end
end
