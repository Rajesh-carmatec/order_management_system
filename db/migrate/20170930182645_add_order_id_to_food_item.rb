class AddOrderIdToFoodItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_items, :order, foreign_key: true
  end
end
