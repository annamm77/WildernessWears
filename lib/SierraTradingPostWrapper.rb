require 'httparty'

class SierraTradingPostWrapper
  attr_reader :name, :url, :image

  BASE_URL = "http://api.sierratradingpost.com/api/1.0/"

  def initialize(data)
    @name = data["Name"]
    @url = data["WebUrl"]
    @image = data["Images"]["PrimaryMedium"]
  end

  def self.search(term)
    #replaces spaces with "-"s.
    term.gsub! /\s+/, '-'
    data = HTTParty.get(BASE_URL + "products/search~#{term}/?api_key=#{ENV["SIERRA_TRADING_POST_KEY"]}").parsed_response
    data = data["Result"].sample

    self.new(data)
  end

end
