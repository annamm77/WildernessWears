class Outfit < ActiveRecord::Base
  attr_reader :top, :bottom, :extras

  def initialize(temp,id)
    @top = find_top(temp)
    @bottom = find_bottom(temp)
    @extras = find_extras(temp,id)
  end

  private

    def find_top(temp)
      # 60+   = tank top
      # 50-59 = t-shirt
      # 40-49 = long sleeve & light jacket
      # 30-39 = long sleeve & heavy jacket
      # 29-   = long sleeve & snow jacket
    end

    def find_bottom(temp)
      # 60+   = shorts
      # 50-59 = shorts
      # 40-49 = leggings
      # 30-39 = leggings
      # 29-   = snow pants
    end

    def find_extras(temp,id)
      # by id
      # 200 = thunderstorm
      # 300 = drizzle
      # 500 = rain
      # 600 = snow
      # 800 = clear

      # by temp
      # 30-39 = gloves & earwarmers
      # 29-   = gloves & hat
    end

end
