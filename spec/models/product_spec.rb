require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:country_of_origin) }

  it("titleizes the name of the product and downcases country of origin") do
    product = Product.create({name: "cheese", cost: 5, country_of_origin: "FRANCE"})
    expect(product.name()).to(eq("Cheese"))
    expect(product.country_of_origin()).to(eq("france"))
  end
end