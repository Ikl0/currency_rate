class CreateExchangeRates < ActiveRecord::Migration[7.1]
  def change
    create_table :exchange_rates do |t|
      t.references :currency, foreign_key: true, null: false
      t.decimal :rate, precision: 10, scale: 5, null: false
      t.date :date, null: false
      t.timestamps
    end
    add_index :exchange_rates, [:currency_id, :date], unique: true
  end
end
