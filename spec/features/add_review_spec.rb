require 'rails_helper'

describe "the review creating process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "hello@hello.com", :password => "bye", :password_confirmation => "bye", :admin => false})
    test_admin = User.create!({:email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true})
    test_product = Product.create({:name => "Cheese", :cost => "3", :country_of_origin => "France"})
  end

  it "adds a new review for admin user" do
    visit signin_path
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "admin"
    click_on "Sign in Please"
    visit products_path
    click_link "Cheese"
    click_on "Want to add a Review?"
    fill_in "Author", :with => "Stan Van Gundy"
    fill_in "Content body", :with => "This has to be one of the best cheese's I've ever tried in my life!"
    fill_in "Rating", :with => "4"
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully created!'
    expect(page).to have_content "Author: Stan Van Gundy"
  end

  it "adds a new review for non admin user" do
    visit signin_path
    fill_in "Email", :with => "hello@hello.com"
    fill_in "Password", :with => "bye"
    click_on "Sign in Please"
    visit products_path
    click_link "Cheese"
    click_on "Want to add a Review?"
    fill_in "Author", :with => "Stan Van Gundy"
    fill_in "Content body", :with => "This has to be one of the best cheese's I've ever tried in my life!"
    fill_in "Rating", :with => "4"
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully created!'
    expect(page).to have_content "Author: Stan Van Gundy"
  end
end