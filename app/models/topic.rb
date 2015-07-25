class Topic < ActiveRecord::Base
  has_many :debates
  has_many :sides

  validates :title, { presence: true, uniqueness: true }

  def category_img
    if self.category == "Politics"
      "capital5.png"
    elsif self.category == "Religion"
      "hinduism3.png"
    elsif self.category == "Pop Culture"
      "popcorn2.png"
    elsif self.category == "Philosophy"
      "head-outline.png"
    else
      "question-mark.png"
    end
  end
end
