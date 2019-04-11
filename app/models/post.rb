class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait


def clickbait
  if title.present? && !title.include?("Won\'t Believe" || "Secret" || "Top [number]" || "Guess")
    errors.add(:title, "Not Clickbait")
  end
end

end

# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.
