class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.string :id, null: false, primary_key: true

      # Typically store as an integer amount with the lowest denomination. (ie. 1 = 1 cent)
      # Here, we'll store as a decimal for simplicity.
      t.decimal :currency_amount, default: 0.0
      t.string :currency_code, default: "USD"
      t.timestamps
    end
    add_index :users, :id, unique: true
  end
end
