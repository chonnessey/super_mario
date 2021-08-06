class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :cost, presence: true
  validates :country_of_origin, presence: true, uniqueness: {case_sensitive: false}
  scope :three_most_recent, -> { order(created_at: :desc).limit(3) }

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end