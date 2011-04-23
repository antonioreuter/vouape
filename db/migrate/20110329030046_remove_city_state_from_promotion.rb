class RemoveCityStateFromPromotion < ActiveRecord::Migration
  def self.up
    remove_column :promotions, :city
    remove_column :promotions, :state
  end

  def self.down
    add_column :promotions, :state, :string
    add_column :promotions, :city, :string
  end
end
