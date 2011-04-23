class RemoveAddressFromPromotions < ActiveRecord::Migration
  def self.up
    remove_column :promotions, :address
  end

  def self.down
    add_column :promotions, :address, :string
  end
end
