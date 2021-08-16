require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of(:author)}
  it { should validate_presence_of(:rating)}
  it { should validate_presence_of(:content_body)}
  it { should validate_length_of(:content_body) }
  it { should validate_length_of(:rating) }
  it { should validate_presence_of(:product_id) }

  it("titleizes the author of the review") do
    product = Product.create({name: "cheese", cost: 5, country_of_origin: "france"})
    review = Review.create({author: "moo", content_body: "this is the best dang cheese I done ever tasted in my life, WOW!", rating: "5", product_id: product.id})
    expect(review.author()).to(eq("Moo"))
  end
end
