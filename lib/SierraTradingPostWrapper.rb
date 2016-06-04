require 'httparty'

class SierraTradingPostWrapper
  attr_reader :id

  BASE_URL = "http://api.sierratradingpost.com/api/1.0/"

  def initialize(data)
    @id = data["weather"][0]["id"]
  end

  def self.search(term)
    #replaces spaces with -s
    term.gsub! /\s+/, '-'
    data = HTTParty.get(BASE_URL + "products/search~#{term}/?api_key=#{ENV["SIERRA_TRADING_POST_KEY"]}").parsed_response
    binding.pry
    # data["Result"] array of 24 results.
    # data["Result"][0]["WebUrl"]
    # data["Result"][0]["Images"]["PrimaryMedium"]
    # data["Result"][0]["Name"]

    self.new(data)
  end

end
