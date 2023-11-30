# frozen_string_literal: true

%w[USD EUR CNY].each do |currency_name|
  Currency.create(name: currency_name)
end

(Date.today - 1.month..Date.today).each do |date|
  Currency.update_exchange_rates(date)
end
