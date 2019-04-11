class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :must_be_clickbait, on: :create

  def must_be_clickbait
    if title.present?
      if !(title.include?("Won't Believe") || title.include?("Secret") || title.include?("top[number]") || title.include?("Guess"))
        errors.add(:title, "must be clickbait")
      end
    end
  end
end
