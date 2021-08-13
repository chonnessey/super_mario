class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true, uniqueness: {case_sensitive: false}
  validates :rating, presence: true, length: { in: 1..5}
  validates :content_body, presence: true, uniqueness: {case_sensitive: false}, length: { in: 50..250 }

  before_save(:titleize_author)

  private
    def titleize_author
      self.author= self.author.titleize
    end
end
