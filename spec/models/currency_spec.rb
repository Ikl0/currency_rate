require 'rails_helper'

RSpec.describe Currency, type: :model do
  let!(:currency) { create(:currency) }
  let!(:exchange_rate) { create(:exchange_rate, currency: currency) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:exchange_rates).dependent(:destroy) }
  end

  describe '.update_exchange_rates with code 200' do
    before do
      allow(Net::HTTP).to receive(:get_response).and_return(instance_double(Net::HTTPResponse, code: '200', body: '{"Valute": {"USD": {"Value": 1.23456}}}'))
    end

    it 'sets the correct rate for the new exchange rate' do
      Currency.update_exchange_rates
      expect(currency.exchange_rates.last.rate).to eq(1.23456)
    end
  end

  describe '.update_exchange_rates with code 404' do
    before do
      allow(Net::HTTP).to receive(:get_response).and_return(instance_double(Net::HTTPResponse, code: '404'))
    end

    context 'when there is a previous exchange rate' do
      let!(:previous_rate) { create(:exchange_rate, currency: currency, rate: 1.23456, date: Date.yesterday) }

      it 'uses the last available rate' do
        Currency.update_exchange_rates
        expect(currency.exchange_rates.last.rate).to eq(previous_rate.rate)
      end
    end

    context 'when there is no previous exchange rate' do
      it 'does not create a new exchange rate' do
        expect { Currency.update_exchange_rates }.not_to change { currency.exchange_rates.count }
      end
    end
  end
end
