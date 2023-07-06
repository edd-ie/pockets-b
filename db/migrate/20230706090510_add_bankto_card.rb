class AddBanktoCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :bank, :string
  end
end
