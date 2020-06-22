require "rails_helper"

RSpec.describe "Discount edit" do
  it "merchants can edit a discounts price and item_quantity" do
      merchant = create(:merchant)
      discount = merchant.discounts.create(percent: 5, item_quantity: 10)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      visit edit_merchant_discount_path(discount.id)
      fill_in 'Percent', with: 10
      fill_in 'Item Quantity', with: 20
      click_on "Update Discount"
      expect(current_path).to eq(merchant_discounts_path)
      expect(page).to have_content("Discount Edited")
      within "#discounts-#{discount.id}" do
        expect(page).to have_content("10%")
        expect(page).to have_content("20 or more items")
      end
  end
  it "merchants must fill out all fields" do
      merchant = create(:merchant)
      discount = merchant.discounts.create(percent: 5, item_quantity: 10)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      visit "/merchant/discounts/#{discount.id}/edit"
      fill_in 'Percent', with: -1
      click_on "Update Discount"
      expect(page).to have_content("Percent must be greater than 0")
      expect(page).to have_button("Update Discount")
  end
end
