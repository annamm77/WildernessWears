require 'OpenWeatherMapWrapper'
require 'outfit'

class WeatherController < ApplicationController

  def createoutfit
    @wrapper = OpenWeatherMapWrapper.find(params["zipcode"])
    raise
    #take zip code from params
    #create a wrapper from that zip code
    #create an outfit model from the wrapper
    #establish _weather and _outfit partial info
    #render weather#showoutfit
  end

end
