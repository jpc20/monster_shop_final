class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.integer :percent
      t.integer :item_quantity
      t.references :merchant, foreign_key: true
    end
  end
end
