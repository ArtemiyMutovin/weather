class Api::V1::WeatherController < ApplicationController

  def current
    render json: WeatherService.new.current
  end

  def historical
    render json: WeatherService.new.client.history
  end

  def by_time
    response = WeatherService.new.by_time(params[:timestamp])
    if response.present?
      render json: response
    else
      head :not_found
    end
  end
end
