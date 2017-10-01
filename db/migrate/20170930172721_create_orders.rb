class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :tittle
      t.text :description

      t.timestamps
    end
  end
end
