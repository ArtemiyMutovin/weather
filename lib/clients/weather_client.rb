class WeatherClient

  ROOT_ENDPOINT = 'https://dataservice.accuweather.com/'.freeze
  DEFAULT_CITY_LOCATION_KEY = 291_102

  def initialize
    @client = setup_client
  end

  def current_conditions
    response = get_request("#{ROOT_ENDPOINT}currentconditions/v1/#{DEFAULT_CITY_LOCATION_KEY}?apikey=#{ENV['API_KEY']}").body
    JSON.parse(response) if response.present?
  end

  def history
    response = get_request("#{ROOT_ENDPOINT}currentconditions/v1/#{DEFAULT_CITY_LOCATION_KEY}/historical/24?apikey=#{ENV['API_KEY']}").body
    JSON.parse(response) if response.present?
  end

  private

  def get_request(url, params = nil)
    @client.get(url, params) do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body.to_json
    end
  end

  def setup_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
