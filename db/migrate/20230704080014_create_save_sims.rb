class CreateSaveSims < ActiveRecord::Migration[6.1]
  def change
    create_table :save_sims do |t|
      t.string :goalName
      t.string :amount
      t.integer :saving_id
      t.integer :sim_id

      t.timestamps
    end
  end
end
