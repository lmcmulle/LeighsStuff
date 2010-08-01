class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
        t.integer :locatable_id
         t.string :locatable_type,  :limit => 25, :default => "", :null => false
         t.string :name
         t.text   :description
         t.string :street
         t.string :locality
         t.string :region
         t.string :postal_code
         t.string :country
         t.integer :user_id
         t.decimal :latitude, :precision => 15, :scale => 12
         t.decimal :longitude,  :precision => 15, :scale => 12

          t.timestamps
    end
      add_index :locations, :locatable_id
      add_index :locations, :locatable_type
      add_index :locations, :street
      add_index :locations, :locality
      add_index :locations, :region
      add_index :locations, :postal_code
      add_index :locations, :country
      add_index :locations, :latitude
      add_index :locations, :longitude
      add_index :locations, :user_id
  end

  def self.down
    drop_table :locations
  end
end
