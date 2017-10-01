class FoodItem < ApplicationRecord
	belongs_to :order, optional: true
end
