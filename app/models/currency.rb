require 'net/http'
require 'json'

class Currency < ApplicationRecord
  has_many :exchange_rates, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.update_exchange_rates
    ["USD", "EUR", "CNY"].each do |currency_name|
      currency = find_or_create_by(name: currency_name)

      (1..30).each do |i|
        date = Date.today - i
        url = URI("https://www.cbr-xml-daily.ru/archive/#{date.year}/#{date.month}/#{date.day}/daily_json.js")

        begin
          response = Net::HTTP.get(url)
          data = JSON.parse(response)
          rate = data["Valute"][currency_name]["Value"]
        rescue
          rate = 0
        end

        unless currency.exchange_rates.exists?(date: date)
          currency.exchange_rates.create(rate: rate, date: date)
        end
      end
    end
  end
end
