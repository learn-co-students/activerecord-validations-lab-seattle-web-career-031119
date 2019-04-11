class Post < ActiveRecord::Base
  belongs_to :author

  validates :title, :presence => true
  validates :content, :length => {:minimum => 250}
  validates :summary, :length => {:maximum => 250}
  validates :category, :inclusion => {:in => ["Fiction","Non-Fiction"]}
  validates :title, :inclusion => {:in => ["Won't Believe", "Secret", "Top [number]","Guess"]}

end
