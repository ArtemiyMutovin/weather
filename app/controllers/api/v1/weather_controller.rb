class Api::V1::WeatherController < ApplicationController

  def current
    current_condition = WeatherClient.new.current_conditions.first
    render json: current_condition['Temperature']['Metric']['Value']
  end

  def historical
    information = WeatherClient.new.history
    historical_data = []
    information.each do |hash|
      historical_data << { date: hash['LocalObservationDateTime'],
                           temperature: hash['Temperature']['Metric']['Value'] }
    end
    render json: historical_data
  end

  def by_time
    render json: 'By_time'
  end
end
