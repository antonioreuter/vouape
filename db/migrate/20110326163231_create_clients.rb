class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name, :null => false, :limit => 100
      t.string :address
      t.string :phone_1, :null => false
      t.string :phone_2
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
