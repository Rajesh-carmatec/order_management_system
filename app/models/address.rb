class Address < ApplicationRecord
  belongs_to :user

  scope :get_current_address, -> { where(is_current_address: true)}
end
