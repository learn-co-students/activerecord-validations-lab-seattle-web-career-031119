class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-
    Fiction"]}

  validate :title_is_clickbait

  # validate :post_id_validity

  # def post_id_validity
  #   if !self.id.present?
  #     errors.add(:id, "This post is not saved in the db.")
  #   end
  # end

  def title_is_clickbait
    # binding.pry
    if self.title.present? && !self.title.empty?
      if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top [number]") && !self.title.include?("Guess")
        errors.add(:title, "Title needs to be more enticing.")
      end
    end
  end

end
