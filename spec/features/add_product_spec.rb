require 'rails_helper'

describe "the product creating process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "hello@hello.com", :password => "bye", :password_confirmation => "bye", :admin => false})
    test_admin = User.create!({:email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true})
  end

  it "adds a new product" do
    visit signin_path
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "admin"
    click_on "Sign in Please"
    visit products_path
    click_link "Create new product"
    fill_in "product[name]", :with => "Cheese"
    fill_in "Cost", :with => "5"
    fill_in "product[country_of_origin]", :with => "France"
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully created!'
    expect(page).to have_content "Cheese"
  end

  it "gives an error message when a non admin user tries to add a product" do
    visit signin_path
    fill_in "Email", :with => "hello@hello.com"
    fill_in "Password", :with => "bye"
    click_on "Sign in Please"
    visit products_path
    click_link "Create new product"
    expect(page).to have_content "You need to be an admin to access this page!"
  end

end