require 'rails_helper'

RSpec.describe Api::V1::WeatherController, type: :controller do

  describe 'GET #current' do
    it 'renders current json ' do
      expect(response).to eq(WeatherService.new.current)
    end
  end

  describe 'GET #historical' do
    it 'renders historical json ' do
      expect(response).to eq(WeatherService.new.historical)
    end
  end
end
