class CreateUserPromotions < ActiveRecord::Migration
  def self.up
    create_table :user_promotions do |t|
      t.integer :user_id
      t.integer :promotion_id
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :user_promotions
  end
end
