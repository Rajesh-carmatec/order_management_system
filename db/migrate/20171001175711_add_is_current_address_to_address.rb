class AddIsCurrentAddressToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :is_current_address, :boolean
  end
end
