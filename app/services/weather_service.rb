class WeatherService

  def initialize(weather, client: nil)
    @weather = weather
    @client = client || WeatherClient.new
  end

  def call; end
end
