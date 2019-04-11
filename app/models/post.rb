class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :summary, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title, on: :create
  validate :validate_title_has_clickbait

  def validate_title_has_clickbait
    if title.present?
      if !title.include?("Won\'t Believe" || "Secret" || "Top[number]" || "Guess")
        errors.add(:title, "Need clickbait")
      end
    end
  end

end
