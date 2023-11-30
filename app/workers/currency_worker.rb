class CurrencyWorker
  include Sidekiq::Worker

  def perform
    Currency.update_exchange_rates
  end
end
