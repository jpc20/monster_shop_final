class Discount < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :percent, :item_quantity
  validates_numericality_of :percent, greater_than: 0, less_than_or_equal_to: 100
  validates_numericality_of :item_quantity, greater_than: 0


  def self.find_eligible(item_quantity)
    where("discounts.item_quantity <= ?", item_quantity).order(percent: :desc).first
  end
end
