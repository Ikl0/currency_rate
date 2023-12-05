# frozen_string_literal: true

require 'benchmark'
require 'concurrent'

time = Benchmark.measure do
  %w[USD EUR CNY].each do |currency_name|
    Currency.create(name: currency_name)
  end

  pool = Concurrent::FixedThreadPool.new(4)

  (Date.today - 1.month..Date.today).each do |date|
    Concurrent::Future.execute(executor: pool) do
      Currency.update_exchange_rates(date)
    end
  end

  pool.shutdown
  pool.wait_for_termination
end

puts time.real