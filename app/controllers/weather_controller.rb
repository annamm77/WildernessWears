require 'OpenWeatherMapWrapper'
require 'outfit'

class WeatherController < ApplicationController

  def create_outfit
    @wrapper = OpenWeatherMapWrapper.find(params["zipcode"])
    @outfit = Outfit.new(temp: @wrapper.temp, id: @wrapper.id)
    #establish _weather and _outfit partial info
    #render weather#showoutfit
  end

end
