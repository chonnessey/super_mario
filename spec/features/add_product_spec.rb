require 'rails_helper'

describe "the product creating process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "hello@hello.com", :password => "bye", :password_confirmation => "bye", :admin => false})
    test_admin = User.create!({:email => "admin@admin.com", :password => "admin", :password_confirmation => "admin", :admin => true})
    # test_product = Product.create({:name => "Cheese", :cost => "5", :country_of_origin => "France"})
  end

  it "adds a new product" do
    visit signin_path
    fill_in "Email", :with => "admin@admin.com"
    fill_in "Password", :with => "admin"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_link "Create new product"
    fill_in "product[name]", :with => "Cheese"
    fill_in "Cost", :with => "5"
    fill_in "product[country_of_origin]", :with => "France"
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content "Cheese"
  end
end