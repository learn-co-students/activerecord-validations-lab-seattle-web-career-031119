require "pry"
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbaity_title

  def clickbaity_title
    return if !self.title

    if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.match(/Top \d+/) && !self.title.include?("Guess")

       errors.add(:title, "Title isn't clickbaity")

     end
  end

end
