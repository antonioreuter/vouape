class AddImageToPromotion < ActiveRecord::Migration
  def self.up
    add_column :promotions, :promotional_image, :string
  end

  def self.down
    remove_column :promotions, :promotional_image
  end
end
