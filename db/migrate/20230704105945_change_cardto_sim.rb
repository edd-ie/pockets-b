class ChangeCardtoSim < ActiveRecord::Migration[6.1]
  def change
    rename_column :sim_transactions, :card_id, :sim_id
  end
end
