class ChangeAmountToIntegerSaveSim < ActiveRecord::Migration[6.1]
  def change
    change_column :save_sims, :amount, 'integer USING CAST(amount AS integer)'
  end
end
