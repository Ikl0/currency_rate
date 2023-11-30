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
      start_date = (i+1).weeks.ago.at_beginning_of_week - 2.days
      end_date = (i+1).weeks.ago.at_end_of_week - 1.day
      [start_date, end_date]
    end.reverse
  end
end