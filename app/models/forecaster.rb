class Forecaster

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def city
    # @city ||= Geo.search(@latitude, @longitude).city
    'おきなわ'
  end

  def city_name
    # city.name
    city
  end

  def wether
    city_name == '長岡' ? '雪' : '晴れ'
  end

end
