require 'rails_helper'

describe "the update a product process" do
    it "updates a new product" do
        product = Product.create(name: "DJ Roomba", cost: 300, country_of_origin: "United States of America")
        visit product_path(product.id)
        click_on "Edit"
        fill_in 'Name', :with => '1960 First Press Giant Steps vinyl'
        fill_in 'Cost', :with => '27'
        fill_in 'Country of origin', :with => 'Belgium'
        click_on 'Update Product'
      expect(page).to have_content 'First Press Giant Steps Vinyl was successfully updated!'
      expect(page).to have_content '1960 First Press Giant Steps Vinyl'
    end
  
    it "gives an error when no name is entered" do
      product = Product.create(name: "DJ Roomba", cost: 300, country_of_origin: "United States of America")
      visit product_path(product.id)
      click_on "Edit"
      fill_in 'Name', :with => ''
      fill_in 'Cost', :with => ''
      fill_in 'Country of origin', :with => ''
      click_on 'Update Product'
      expect(page).to have_content "Name can't be blank"
    end
  end