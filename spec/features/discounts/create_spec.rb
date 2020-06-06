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

  it "merchants can create a discount" do
    merchant = create(:merchant)
    user = create(:user, role: 1, merchant_id: merchant.id)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit new_merchant_discount_path
    fill_in 'Percent', with: 5
    fill_in 'Item Quantity', with: 20
    click_on "Create Discount"
    new_discount = Discount.last
    expect(current_path).to eq(merchant_discounts_path)
    expect(page).to have_content("New Discount Created")
    within "#discounts-#{new_discount.id}" do
      expect(page).to have_content("5%")
      expect(page).to have_content("20 or more items")
    end
  end

  it "merchants must fill out all fields when creating a discount" do
    merchant = create(:merchant)
    user = create(:user, role: 1, merchant_id: merchant.id)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit new_merchant_discount_path
    fill_in 'Percent', with: ""
    fill_in 'Item Quantity', with: -2
    click_on "Create Discount"
    expect(page).to have_content("Percent can't be blank, Percent is not a number, and Item quantity must be greater than 0")
    expect(page).to have_button("Create Discount")
  end
end
