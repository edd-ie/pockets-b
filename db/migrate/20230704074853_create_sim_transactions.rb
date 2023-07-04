class CreateSimTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :sim_transactions do |t|
      t.string :category
      t.integer :amount
      t.integer :card_id

      t.timestamps
    end
  end
end
