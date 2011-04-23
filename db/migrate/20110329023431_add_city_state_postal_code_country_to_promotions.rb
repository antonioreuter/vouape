class AddCityStatePostalCodeCountryToPromotions < ActiveRecord::Migration
  def self.up
    add_column :promotions, :city, :string
    add_column :promotions, :state, :string
    add_column :promotions, :postal_code, :string
    add_column :promotions, :country, :string
  end

  def self.down
    remove_column :promotions, :country
    remove_column :promotions, :postal_code
    remove_column :promotions, :state
    remove_column :promotions, :city
  end
end
