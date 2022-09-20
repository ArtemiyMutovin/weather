require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Weather API', type: :request do

  describe 'GET /api/v1/weather/current' do
    it 'returns current temperature' do
      get '/api/v1/weather/current'
      expect(JSON.parse(response.body)).to eq(WeatherService.new.current)
    end
  end

  describe 'GET /api/v1/weather/historical' do
    it 'returns temperature and time for the last 24 hours' do
      get '/api/v1/weather/historical'
      expect(JSON.parse(response.body)).to eq(WeatherService.new.historical)
    end
  end

  describe 'GET /api/v1/weather/historical/max' do
    it 'returns maximal temperature for the last 24 hours' do
      get '/api/v1/weather/historical/max'
      expect(JSON.parse(response.body)).to eq(WeatherService.new.max)
    end
  end

  describe 'GET /api/v1/weather/historical/min' do
    it 'returns minimal temperature for the last 24 hours' do
      get '/api/v1/weather/historical/min'
      expect(JSON.parse(response.body)).to eq(WeatherService.new.min)
    end
  end

  describe 'GET /api/v1/weather/historical/avg' do
    it 'returns average temperature for the last 24 hours' do
      get '/api/v1/weather/historical/avg'
      expect(JSON.parse(response.body)).to eq(WeatherService.new.avg)
    end
  end

  describe 'GET /api/v1/health' do
    it 'returns status OK' do
      get '/api/v1/health'
      expect(response.status).to eq(200)
    end
  end
end
