class CreateSaveCards < ActiveRecord::Migration[6.1]
  def change
    create_table :save_cards do |t|
      t.string :goalName
      t.string :amount
      t.integer :saving_id
      t.integer :card_id

      t.timestamps
    end
  end
end
