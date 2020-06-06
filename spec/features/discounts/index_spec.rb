require "rails_helper"

RSpec.describe "Discount Index" do
  it "merchants can see all discounts percent and quantity" do
      merchant = create(:merchant)
      discount1 = merchant.discounts.create(percent: 5, item_quantity: 10)
      discount2 = merchant.discounts.create(percent: 10, item_quantity: 20)
      discount3 = merchant.discounts.create(percent: 15, item_quantity: 30)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      expect(current_path).to eq(merchant_dashboard_path)
      click_link "View Bulk Discounts"
      within "#discounts-#{discount1.id}" do
        expect(page).to have_content("5%")
        expect(page).to have_content("10 or more items")
      end
      within "#discounts-#{discount2.id}" do
        expect(page).to have_content("10%")
        expect(page).to have_content("20 or more items")
      end
      within "#discounts-#{discount3.id}" do
        expect(page).to have_content("15%")
        expect(page).to have_content("30 or more items")
      end
    end

    it "discount id links to discount show page" do
      merchant = create(:merchant)
      discount1 = merchant.discounts.create(percent: 5, item_quantity: 10)
      discount2 = merchant.discounts.create(percent: 10, item_quantity: 20)
      discount3 = merchant.discounts.create(percent: 15, item_quantity: 30)
      user = create(:user, role: 1, merchant_id: merchant.id)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      expect(current_path).to eq(merchant_dashboard_path)
      click_link "View Bulk Discounts"
      within "#discounts-#{discount1.id}" do
        click_link discount1.id
      end
      expect(current_path).to eq("/merchant/discounts/#{discount1.id}")
    end
end
