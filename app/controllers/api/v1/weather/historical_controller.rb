class Api::V1::Weather::HistoricalController < ApplicationController

  def max
    render json: WeatherService.new.max
  end

  def min
    render json: WeatherService.new.min
  end

  def avg
    render json: WeatherService.new.avg
  end
end
