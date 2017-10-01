class Order < ApplicationRecord

	has_many :food_items, :dependent => :delete_all

	accepts_nested_attributes_for :food_items,
									allow_destroy: true,
									reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :tittle, :description

end
