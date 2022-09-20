class WeatherClient

  ROOT_ENDPOINT = 'https://dataservice.accuweather.com/'.freeze
  DEFAULT_CITY_LOCATION_KEY = 291_102

  def initialize
    @client = setup_client
  end

  def current_conditions
    response = get_request(current_conditions_url, apikey: Rails.application.credentials.api_key)
    JSON.parse(response.body).first if response.status.eql?(200)
  end

  def history
    response = get_request(
      "#{current_conditions_url}/historical/24",
      apikey: Rails.application.credentials.api_key
    )
    JSON.parse(response.body) if response.status.eql?(200)
  end

  private

  def get_request(url, params = nil)
    @client.get(url, params) do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body.to_json
    end
  end

  def current_conditions_url
    "#{ROOT_ENDPOINT}currentconditions/v1/#{DEFAULT_CITY_LOCATION_KEY}"
  end

  def setup_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
