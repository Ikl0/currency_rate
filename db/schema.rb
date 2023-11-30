# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 20_231_129_122_737) do
  enable_extension 'plpgsql'

  create_table 'currencies', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_currencies_on_name', unique: true
  end

  create_table 'exchange_rates', force: :cascade do |t|
    t.bigint 'currency_id', null: false
    t.decimal 'rate', precision: 10, scale: 5, null: false
    t.date 'date', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[currency_id date], name: 'index_exchange_rates_on_currency_id_and_date', unique: true
    t.index ['currency_id'], name: 'index_exchange_rates_on_currency_id'
  end

  add_foreign_key 'exchange_rates', 'currencies'
end
