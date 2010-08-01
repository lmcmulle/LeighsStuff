class PluginSchema < ActiveRecord::Migration
   def self.up
      create_table :geocodes do |t|
        t.decimal :latitude, :precision => 15, :scale => 12
        t.decimal :longitude, :precision => 15, :scale => 12
        t.string :query
        t.string :street
        t.string :locality
        t.string :region
        t.string :postal_code
        t.string :country
        t.string :precision
      end

      create_table :geocodings do |t|
        t.integer :geocodable_id
        t.integer :geocode_id
        t.string :geocodable_type
      end

    create_table :tags do |t|
      t.column :name, :string
    end

    create_table :taggings do |t|
      t.column :tag_id, :integer
      t.column :taggable_id, :integer
      t.column :tagger_id, :integer
      t.column :tagger_type, :string

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.column :taggable_type, :string
      t.column :context, :string

      t.column :created_at, :datetime
    end

      add_index "geocodes", ["longitude"], :name => "geocodes_longitude_index"
      add_index "geocodes", ["latitude"], :name => "geocodes_latitude_index"
      add_index "geocodes", ["query"], :name => "geocodes_query_index", :unique => true
      add_index "geocodes", ["locality"], :name => "geocodes_locality_index"
      add_index "geocodes", ["region"], :name => "geocodes_region_index"
      add_index "geocodes", ["postal_code"], :name => "geocodes_postal_code_index"
      add_index "geocodes", ["country"], :name => "geocodes_country_index"
      add_index "geocodes", ["precision"], :name => "geocodes_precision_index"
      add_index "geocodings", ["geocodable_type"], :name => "geocodings_geocodable_type_index"
      add_index "geocodings", ["geocode_id"], :name => "geocodings_geocode_id_index"
      add_index "geocodings", ["geocodable_id"], :name => "geocodings_geocodable_id_index"
      add_index :taggings, :tag_id
      add_index :taggings, [:taggable_id, :taggable_type, :context]
   end

  def self.down
      drop_table  :geocodes
      drop_table  :geocodings
      drop_table  :taggings
      drop_table  :tags
  end

end

