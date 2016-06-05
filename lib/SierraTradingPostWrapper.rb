require 'httparty'

class SierraTradingPostWrapper
  attr_reader :name, :url, :image, :price

  BASE_URL = "http://api.sierratradingpost.com/api/1.0/"

  def initialize(data)
    data["Name"].slice! " (For Women)"
    @name = data["Name"]
    @url = data["WebUrl"]
    @image = data["Images"]["PrimaryMedium"]
    @price = data["FinalPrice"]
  end

  def self.search(term)
    #replaces spaces with "-"s.
    data = HTTParty.get(BASE_URL + "products/search~#{term.gsub /\s+/, '-'}-woman/?api_key=#{ENV["SIERRA_TRADING_POST_KEY"]}").parsed_response
    data = data["Result"].sample
    self.new(data)
  end

end
