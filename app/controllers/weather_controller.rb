require 'OpenWeatherMapWrapper'
require 'outfit'

class WeatherController < ApplicationController

  def create_outfit
    @wrapper = OpenWeatherMapWrapper.find(params["zipcode"])
    raise

    #create an outfit model from the wrapper
    #establish _weather and _outfit partial info
    #render weather#showoutfit
  end

end
