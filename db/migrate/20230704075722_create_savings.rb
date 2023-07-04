class CreateSavings < ActiveRecord::Migration[6.1]
  def change
    create_table :savings do |t|
      t.text :name
      t.integer :goal
      t.integer :duration
      t.integer :saved_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
