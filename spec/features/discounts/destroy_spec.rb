require "rails_helper"

RSpec.describe "From the discount show page" do
  it "merchants can delete a discount" do
      merchant = create(:merchant)
      discount1 = merchant.discounts.create(percent: 5, item_quantity: 10)
      discount2 = merchant.discounts.create(percent: 10, item_quantity: 20)
      discount3 = merchant.discounts.create(percent: 15, item_quantity: 30)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      visit merchant_discount_path(discount1.id)
      click_button "Delete Discount"

      expect(current_path).to eq(merchant_discounts_path)
      expect(page).to have_content("Discount deleted")
      save_and_open_page
      expect(page).to_not have_css("#discounts-#{discount1.id}")
    end
end
