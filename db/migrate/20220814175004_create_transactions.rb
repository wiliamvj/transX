class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description, limit: 150
      t.integer :transaction_value
      t.string :transaction_type, limit: 50

      t.timestamps
    end
  end
end
