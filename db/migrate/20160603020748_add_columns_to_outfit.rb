class AddColumnsToOutfit < ActiveRecord::Migration
  def change
    add_column :outfits, :top, :string
    add_column :outfits, :bottom, :string
    add_column :outfits, :extras, :string
  end
end
