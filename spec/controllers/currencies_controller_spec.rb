require 'rails_helper'

RSpec.describe CurrenciesController, type: :controller do
  let!(:currency) { create(:currency) }
  let!(:exchange_rate) { create(:exchange_rate, currency: currency) }

  describe 'GET #index' do
    before { get :index }

    it 'assigns @currencies' do
      expect(assigns(:currencies)).to eq([currency])
    end

    it 'assigns @dates' do
      expect(assigns(:dates)).to eq([exchange_rate.date])
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #weekly_rates' do
    before { get :weekly_rates }

    it 'assigns @currencies' do
      expect(assigns(:currencies)).to eq([currency])
    end

    it 'assigns @weeks' do
      expect(assigns(:weeks).size).to eq(4)
    end

    it 'renders the weekly_rates template' do
      expect(response).to render_template('weekly_rates')
    end
  end
end
