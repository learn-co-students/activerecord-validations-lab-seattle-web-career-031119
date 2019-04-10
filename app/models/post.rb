class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w(Fiction Nonfiction)
  validate :is_clickbait?, if: :title

  def is_clickbait?
    # binding.pry
    keywords = ["Won't Believe", "Secret", "Guess", "Top"]
    if !keywords.map { |k| self.title.include?(k) }.include?(true) # && !self.title.match(/[Top \d]+/)
      errors.add(:title, "Must be clickbait (how cynical)")
    end
  end

end
