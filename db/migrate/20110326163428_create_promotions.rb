class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.string    :title, :null =>false
      t.text      :description, :null =>false
      t.string    :address, :null => false
      t.decimal   :price, :precision => 8, :scale => 2
      t.string    :latitude, :null => false
      t.string    :longitude, :null => false
      t.integer   :client_id, :null => false
      t.datetime  :imported_date
      t.date      :start_date, :null => false
      t.date      :finish_date, :null => false
      t.boolean   :active

      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
