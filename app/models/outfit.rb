class Outfit < ActiveRecord::Base
  attr_reader :top, :bottom, :extras

  def initialize(temp,id)
    @top = find_top(temp)
    @bottom = find_bottom(temp)
    @extras = find_extras(temp,id)
  end

private

  def find_top(temp)
    if temp >= 60
      return ["Tank Top"]
    elsif temp >= 50 && temp < 60
      return ["T-Shirt"]
    elsif temp >= 40 && temp < 50
      return ["Long Sleeve Shirt","Light Jacket"]
    elsif temp >= 30 && temp < 40
      return ["Long Sleeve Shirt","Heavy Jacket"]
    elsif temp <= 29
      return ["Long Sleeve Shirt","Snow Jacket"]
    else
      return []
    end
  end

  def find_bottom(temp)
    if temp >= 60
      return ["Shorts"]
    elsif temp >= 50 && temp < 60
      return ["Shorts"]
    elsif temp >= 40 && temp < 50
      return ["Pants"]
    elsif temp >= 30 && temp < 40
      return ["Pants"]
    elsif temp <= 29
      return ["Snow Pants"]
    else
      return []
    end
  end

  def find_extras(temp,id)
    extras = []

    if (300...400).include? id
      # drizzle
    elsif (500...600).include? id
      # rain
    elsif (600...700).include? id
      # snow
    elsif (800...900).include? id
      # clear
    else
      []
    end
    # by temp
    # 30-39 = gloves & earwarmers
    # 29-   = gloves & hat

    return extras
  end

end
