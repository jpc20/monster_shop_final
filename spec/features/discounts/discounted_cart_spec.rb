require 'rails_helper'

RSpec.describe "Cart discounts" do
  describe "As a user" do
    before :each do
      @user = create(:user)
      @megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @brian = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)
      @ogre = @megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 15 )
      @giant = @megan.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
      @hippo = @brian.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 3 )
      @megan.discounts.create(percent: 5, item_quantity: 10)
      @megan.discounts.create(percent: 7, item_quantity: 15)
      @megan.discounts.create(percent: 10, item_quantity: 20)
    end

    it "Cart price shows merchant discounts" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit item_path(@ogre)
      click_button 'Add to Cart'
      visit item_path(@hippo)
      click_button 'Add to Cart'
      visit '/cart'
      within "#item-#{@ogre.id}" do
        expect(page).to have_content("Subtotal: $20.00")
        10.times do
          click_button "More of This!"
        end
        expect(page).to have_content("Discounted Subtotal: $209.00")
      end
      expect(page).to have_content("Total: $259.00")
    end

  end
end
