# frozen_string_literal: true

require 'net/http'
require 'json'

class Currency < ApplicationRecord
  has_many :exchange_rates, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.update_exchange_rates(date = Date.today)
    all.each do |currency|
      url = URI("https://www.cbr-xml-daily.ru/archive/#{date.year}/#{date.strftime('%m')}/#{date.strftime('%d')}/daily_json.js")
      response = Net::HTTP.get_response(url)

      rate = if response.code == '404' # if exchange rate is not found(it always not found for sunday, monday and sometimes for tuesday)
               currency.exchange_rates.where("date < '#{date}'").order(date: :desc).first&.rate
             else
               data = JSON.parse(response.body)
               data.dig('Valute', currency.name, 'Value')
             end
      currency.exchange_rates.find_or_create_by(rate:, date:)
    end
  end
end
