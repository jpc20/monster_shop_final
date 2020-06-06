require "rails_helper"

RSpec.describe "Discount creation" do
  it "merchants can access the creation form from the discount index" do
      merchant = create(:merchant)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      visit merchant_discounts_path
      click_link "Create New Discount"
      expect(current_path).to eq(new_merchant_discount_path)
    end
end
