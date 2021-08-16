require 'rails_helper'

describe "the product creating process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "hello@hello.com", :password => "bye", :password_confirmation => "bye", :admin => false})
    test_admin = User.create!({:email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true})
    test_product = Product.create({:name => "Cheese", :cost => "3", :country_of_origin => "France"})
  end

  it "updates a product when an admin user does so" do
    visit signin_path
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "admin"
    click_on "Sign in Please"
    visit products_path
    click_on ("Cheese")
    click_on "Edit Product Details"
    fill_in "Name", :with => "Queso"
    click_on "Update Product"
    expect(page).to have_content "Queso"
  end
end