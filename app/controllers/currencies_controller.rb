# frozen_string_literal: true

class CurrenciesController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    @currencies = Currency.all
    @dates = @currencies.first.exchange_rates.last(30).map(&:date)
  end

  def show
    @currency = Currency.find(params[:id])
  end

  def create
    @currency = Currency.fetch_exchange_rates

    if @currency.save
      render json: @currency, status: :created
    else
      render json: { errors: [@currency.errors] }, status: :unprocessable_entity
    end
  end
end