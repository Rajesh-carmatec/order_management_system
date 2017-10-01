class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :addrress_line_1
      t.string :addrress_line_2
      t.string :pincode
      t.string :city
      t.string :state
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
