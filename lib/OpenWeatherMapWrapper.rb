require 'httparty'

class OpenWeatherMapWrapper
  attr_reader :main, :desc, :temp, :image

  BASE_URL = "http://api.openweathermap.org/data/2.5/"

  def initialize(data)
    @id = data["weather"][0]["id"]
    @main = data["weather"][0]["main"]
    @desc = data["weather"][0]["description"]
    @temp = data["main"]["temp"]
    @image = "http://openweathermap.org/img/w/#{data["weather"][0]["icon"]}.png"
  end

  def self.find(zipcode)
    data = HTTParty.get(BASE_URL + "weather?zip=#{zipcode},us&units=imperial&APPID=#{ENV["OPEN_WEATHER_MAP_KEY"]}").parsed_response
    self.new(data)
  end

  private

  def find_top(temp)
    # 60+   = tank top
    # 50-59 = t-shirt
    # 40-49 = long sleeve & light jacket
    # 30-39 = long sleeve & heavy jacket
    # 29-   = long sleeve & snow jacket
  end

  def find_bottom(temp)
    # 60+   = shorts
    # 50-59 = shorts
    # 40-49 = leggings
    # 30-39 = leggings
    # 29-   = snow pants
  end

  def find_extras(id,temp)
    # by id
    # 200 = thunderstorm
    # 300 = drizzle
    # 500 = rain
    # 600 = snow
    # 800 = clear

    # by temp
    # 30-39 = gloves & earwarmers
    # 29-   = gloves & hat
  end
end
