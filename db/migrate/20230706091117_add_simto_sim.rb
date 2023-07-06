class AddSimtoSim < ActiveRecord::Migration[6.1]
  def change
    add_column :sims, :simName, :string
  end
end
