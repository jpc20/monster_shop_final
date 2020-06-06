require 'rails_helper'

RSpec.describe Discount do
  describe 'Relationships' do
    it {should belong_to :merchant}
  end

  describe 'Validations' do
    it {should validate_numericality_of(:percent).is_greater_than(0)}
    it {should validate_numericality_of(:item_quantity).is_greater_than(0)}
  end

  describe 'methods' do
    it ".find_eligible" do
      megan = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
      ogre = megan.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
      cart = Cart.new({ogre.id.to_s => 10})
      discount1 = megan.discounts.create(percent: 5, item_quantity: 10)
      discount2 = megan.discounts.create(percent: 3, item_quantity: 10)
      discount3 = megan.discounts.create(percent: 10, item_quantity: 15)
      cart.contents[ogre.id.to_s] = 10
      expect(megan.discounts.find_eligible(cart.count_of(ogre.id.to_s))).to eq(discount1)
    end
  end

end
