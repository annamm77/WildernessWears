require 'httparty'

class OpenWeatherMapWrapper
  attr_reader :main, :desc, :temp, :image

  BASE_URL = "http://api.openweathermap.org/data/2.5/"

  def initialize(data)
    @main = data["weather"][0]["main"]
    @desc = data["weather"][0]["description"]
    @temp = data["main"]["temp"] #this is in Kelvin
    @image = "http://openweathermap.org/img/w/#{data["weather"][0]["icon"]}.png"
  end

  def self.find(zipcode)
    data = HTTParty.get(BASE_URL + "weather?zip=#{zipcode},us&units=imperial&APPID=#{ENV["OPEN_WEATHER_MAP_KEY"]}").parsed_response
    self.new(data)
  end

end
