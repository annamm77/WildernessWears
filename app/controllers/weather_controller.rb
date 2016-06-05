require 'OpenWeatherMapWrapper'
require 'outfit'
require 'SierraTradingPostWrapper'

class WeatherController < ApplicationController

  def create_outfit
    @wrapper = OpenWeatherMapWrapper.find(params["zipcode"])
    @outfit = Outfit.new(temp: @wrapper.temp, id: @wrapper.id)

    @top_suggestion = SierraTradingPostWrapper.search(@outfit.top[0])
    @bottom_suggestion = SierraTradingPostWrapper.search(@outfit.bottom[0])
    if @outfit.extras.any?
      @extras_suggestion = SierraTradingPostWrapper.search(@outfit.extras[0])
    end
    
    render "outfit"
  end

end
