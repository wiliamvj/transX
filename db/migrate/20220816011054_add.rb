class Add < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, null: true, foreign_key: true
  end
end
