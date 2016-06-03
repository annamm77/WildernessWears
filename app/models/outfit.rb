class Outfit
attr_accessor :top, :bottom, :extras

def initialize(hash)
  @top = find_top(hash[:temp])
  @bottom = find_bottom(hash[:temp])
  @extras = find_extras(hash[:id])
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
      return ["Pants", "Tights"]
    elsif temp <= 29
      return ["Snow Pants"]
    else
      return []
    end
  end

  def find_extras(id)
    extras = []

    if (300...400).include? id
      # drizzle
      extras << "Raincoat"
    elsif (500...600).include? id
      # rain
      extras << "Raincoat"
    elsif (600...700).include? id
      # snow
      extras << "Warm Hat" << "Gloves"
    else
      []
    end

    return extras
  end
end
