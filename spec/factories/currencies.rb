# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    name { 'USD' }
  end

  factory :exchange_rate do
    currency
    rate { 1.23456 }
    date { Date.today }
  end
end
