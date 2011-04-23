class AddLocalityRegionToPromotions < ActiveRecord::Migration
  def self.up
    add_column :promotions, :locality, :string
    add_column :promotions, :region, :string
  end

  def self.down
    remove_column :promotions, :region
    remove_column :promotions, :locality
  end
end
