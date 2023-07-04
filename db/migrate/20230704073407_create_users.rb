class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :email
      t.text :password_digest
      t.string :subscription

      t.timestamps
    end
  end
end
