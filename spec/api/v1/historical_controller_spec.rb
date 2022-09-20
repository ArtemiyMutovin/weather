require 'rails_helper'

RSpec.describe Api::V1::HistoricalController, type: :controller do

  describe 'GET #max' do
    it 'renders max json ' do
      expect(response).to eq(WeatherService.new.max)
    end
  end

  describe 'GET #min' do
    it 'renders min json ' do
      expect(response).to eq(WeatherService.new.min)
    end
  end

  describe 'GET #avg' do
    it 'renders avg json ' do
      expect(response).to eq(WeatherService.new.avg)
    end
  end
end
