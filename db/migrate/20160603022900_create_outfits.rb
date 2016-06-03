class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :top
      t.string :bottom
      t.string :extras

      t.timestamps null: false
    end
  end
end
