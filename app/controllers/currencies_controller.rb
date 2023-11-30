# frozen_string_literal: true

class CurrenciesController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @currencies = Currency.all
    @dates = @currencies.first.exchange_rates.last(30).map(&:date)
  end

  def weekly_rates
    @currencies = Currency.all
    @weeks = 4.times.map do |i|
      start_date = (i + 1).weeks.ago.prev_occurring(:saturday)
      end_date = start_date + 1.week
      [start_date, end_date]
    end.reverse
  end
end
