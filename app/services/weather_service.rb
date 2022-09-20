class WeatherService

  def initialize(client: nil)
    @client = client || WeatherClient.new
  end

  def current
    @client.current_conditions['Temperature']['Metric']['Value']
  end

  def historical
    information = @client.history
    historical_data = []
    information.each do |hash|
      historical_data << { date: hash['LocalObservationDateTime'],
                           temperature: hash['Temperature']['Metric']['Value'] }
    end
    historical_data
  end

  def max
    information = @client.history
    historical_data = []
    information.each do |hash|
      historical_data << hash['Temperature']['Metric']['Value']
    end
    historical_data.max
  end

  def min
    information = @client.history
    historical_data = []
    information.each do |hash|
      historical_data << hash['Temperature']['Metric']['Value']
    end
    historical_data.min
  end

  def avg
    information = @client.history
    avg = 0
    information.each do |hash|
      avg += hash['Temperature']['Metric']['Value']
    end
    (avg / information.count)
  end

  def by_time(time)
    information = @client.history
    historical_data = {}
    information.each do |hash|
      historical_data[hash['EpochTime'].to_i] =
        { hash['LocalObservationDateTime'] => hash['Temperature']['Metric']['Value'] }
    end
    time = historical_data.keys.reverse.bsearch { |x| x >= time.to_i }
    historical_data[time]
  end
end
