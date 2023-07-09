class ChangeAmountToIntegerSaveCard < ActiveRecord::Migration[6.1]
  def change
    change_column :save_cards, :amount, 'integer USING CAST(amount AS integer)'
  end
end
