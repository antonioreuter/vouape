class AddStreetToPromotions < ActiveRecord::Migration
  def self.up
    add_column :promotions, :street, :string
  end

  def self.down
    remove_column :promotions, :street
  end
end
