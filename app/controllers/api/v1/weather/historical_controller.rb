class Api::V1::Weather::HistoricalController < ApplicationController

  def max
    information = WeatherClient.new.history
    historical_data = []
    information.each do |hash|
      historical_data << hash['Temperature']['Metric']['Value']
    end
    render json: historical_data.max
  end

  def min
    information = WeatherClient.new.history
    historical_data = []
    information.each do |hash|
      historical_data << hash['Temperature']['Metric']['Value']
    end
    render json: historical_data.min
  end

  def avg
    information = WeatherClient.new.history
    avg = 0
    information.each do |hash|
      avg += hash['Temperature']['Metric']['Value']
    end
    render json: (avg / information.count)
  end
end
