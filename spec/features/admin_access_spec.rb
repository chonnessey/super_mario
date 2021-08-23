require 'rails_helper'

describe 'The admin access to reviews' do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "hello@hello.com", :password => "bye", :password_confirmation => "bye", :admin => false})
    test_admin = User.create!({:email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true})
    test_product = Product.create({:name => "Cheese", :cost => "3", :country_of_origin => "France"})
    test_review = Review.create({:author => "Moo", :rating => 5, :content_body => "This has to be the cheesiest, ooziest, gooiest glob of cheese ever.. and I love it!", :product_id => test_product.id})
  end

  it "updates a review when an admin user does so" do
    visit signin_path
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "admin"
    click_on "Sign in Please"
    visit products_path
    click_on ("Cheese")
    click_on "This has to be the cheesiest, ooziest, gooiest glob of cheese ever.. and I love it!"
    click_on "Edit review"
    fill_in "Author", :with => "Luna"
    click_on "Update Review"
    expect(page).to have_content "Luna"
  end

end