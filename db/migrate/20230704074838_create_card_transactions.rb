class CreateCardTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :card_transactions do |t|
      t.string :category
      t.integer :amount
      t.integer :card_id

      t.timestamps
    end
  end
end
