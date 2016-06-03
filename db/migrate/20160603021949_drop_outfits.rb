class DropOutfits < ActiveRecord::Migration
  def change
    drop_table :outfits
  end
end
