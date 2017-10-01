class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.float :amount
      t.string :payment_type
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
