class CurrencyWorker
  include Sidekiq::Worker

  def perform
    Currency.update_exchange_rates(Date.today)
  end
end
