class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true, uniqueness: {case_sensitive: false}
  validates :content_body, presence: true, uniqueness: {case_sensitive: false}

  before_save(:titleize_author)

  private
    def titleize_author
      self.author= self.author.titleize
    end
end
