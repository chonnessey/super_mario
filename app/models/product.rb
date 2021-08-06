class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqeness: {case_sensitive: false}
  validates :cost, presence: true
  validates :country_of_origin, presence: true, uniqeness: {case_sensitive: false}

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end