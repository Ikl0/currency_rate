class ExchangeRate < ApplicationRecord
  belongs_to :currency
  validates :rate, :date, presence: true
  validates :rate, numericality: true
  validates :currency_id, uniqueness: { scope: :date }
end